# Maintainer: Rafael G. Martins <rafael@rafaelmartins.com>

pkgname=tinypy
pkgver=1.1
pkgrel=1
pkgdesc="A minimalist implementation of python in 64k of code"
arch=('i686')
url="http://code.google.com/p/tinypy/"
license=('MIT')
makedepends=('python')
optdepends=('sdl: for pygame module')
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('1091300b72fcc1f75cafb91bea92772e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python setup.py linux pygame
  mkdir -p ${pkgdir}/usr/bin \
           ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/build/${pkgname} ${pkgdir}/usr/bin/
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
