#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=adabooch
pkgver=20190412
pkgrel=2
arch=('any')
pkgdesc="The Ada 95 Booch Components"
url="http://sourceforge.net/projects/booch95/"
license=('GPLv2')
install=$pkgname.install
depends=('gcc-ada')
#makedepends=('gprbuild')
source=(http://downloads.sourceforge.net/booch95/bc-${pkgver}.tgz)
sha512sums=('a5687ba600e66f0cc969f61e8235bdabc935ef5d776925c471f713eac1d14d87b475abb599ade5b4ab1ba8076fdc88a97d54522fcfabbe9fdd7597728dfd53ae')

build() {
    cd ${srcdir}/bc-${pkgver}

    make
}

package() {
   make DESTDIR=${pkgdir} install
}

