# Maintainer: Bennett Goble <nivardus@gmail.com>

pkgname=autobuild
pkgver=0.8.12
pkgrel=1
pkgdesc='Linden Lab Automated Package Management and Build System'
arch=('any')
url='http://wiki.secondlife.com/wiki/Autobuild'
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/a/autobuild/autobuild-${pkgver}.tar.gz)
sha1sums=('5960c008c1f4a64c0d31ef11e18d50de4d09d69a')

build() {
  cd $srcdir/autobuild-${pkgver}
  python2 setup.py install --root=$pkgdir/ --optimize=1
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find $pkgdir -name '*.py')
}

