#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=adabooch
pkgver=20130322
pkgrel=3
arch=('any')
pkgdesc="The Ada 95 Booch Components"
url="http://sourceforge.net/projects/booch95/"
license=('GPLv2')
install=$pkgname.install
depends=('gcc-ada')
makedepends=('gprbuild')
source=(http://downloads.sourceforge.net/booch95/bc-${pkgver}.tgz)
sha512sums=('db572f5c2b4140624e43ac1be6e6a3594c050611e8d0aa4dd53f62c1f0c63ba8e66196e5f60d6151e36639a0bec749d9d2c15b0f6cadb46d761fbd88eafaa085')

build() {
    cd ${srcdir}
    tar zxf bc-${pkgver}.tgz
    cd bc-${pkgver}

        ./configure
        make
}

package() {
   make DESTDIR=${pkgdir} install
}

