#!/bin/bash

PYTHON=/usr/bin/python

# Locate Plone dir
PWD=`pwd`
PARENT=`dirname $PWD`

[ -e $PARENT/PloneTool.py ] && PLONE=$PARENT
[ -e $PARENT/CMFPlone/PloneTool.py ] && PLONE=$PARENT/CMFPlone

if [ -z $PLONE ]; then
    echo "Unable to locate Plone dir!"
    exit 1
fi

[ -e $PLONE/../i18ndude/i18ndude ] && I18NDUDE=$PLONE/../i18ndude/i18ndude

if [ -z $I18NDUDE ]; then
    echo "Unable to locate i18ndude utility!"
    exit 2
fi

export PYTHON I18DUDE

$PYTHON rebuild-pot.py $1 $2
