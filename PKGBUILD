# $Id: PKGBUILD 197348 2016-11-29 09:09:36Z alucryd $
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: Farhad Shahbazi <farhad@enthusiasm.cc>

pkgname=puddletag
pkgver=1.2.0
pkgrel=1
pkgdesc='A tag editor for GNU/Linux'
url='http://puddletag.sourceforge.net'
license=('GPL')
arch=('any')
depends=('chromaprint' 'mutagen' 'python2-configobj' 'python2-musicbrainz2'
         'python2-pyparsing' 'python2-pyqt4')
optdepends=('python2-pillow: FLAC cover art'
            'quodlibet: QuodLibet library support')
source=("puddletag-${pkgver}.tar.gz::https://github.com/keithgg/puddletag/archive/v${pkgver}.tar.gz")
sha256sums=('95e4867fd04c5349f19de1b5f3c1f2336d3b66da08c076fb175ef8f7589dc80d')

prepare() {
  cd puddletag-${pkgver}/source

  sed -i 's|^#!.*python$|#!/usr/bin/python2|' $(grep -rl '^#!.*python')
}

build() {
  cd puddletag-${pkgver}/source

  python2 setup.py config
}

package() {
  cd puddletag-${pkgver}/source

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}

# vim: ts=2 sw=2 et:
