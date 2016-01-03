# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Allen Choong <allencch at hotmail dot com>

pkgname=qwebapp
pkgver=1.0
pkgrel=1
pkgdesc="Fast and slick customizable minimalistic web browser used for making desktop launchers for web apps. Works on Linux, Windows and Mac OS X. Stable release."
url="https://github.com/zatherz/qwebapp/"
arch=('i686' 'x86_64')
license=('GPL2')
provides=('qwebapp')
conflicts=('qwebapp')
depends=('qt5-base' 'qt5-webkit')
source=(${pkgname}.tar.gz::https://github.com/zatherz/qwebapp/archive/1.0.tar.gz)
sha512sums=('SKIP')

build() {
  cd ${pkgname}-${pkgver}
  if [ ! -e "build" ]; then
    mkdir build
  fi
  cd build
  qmake-qt5 ..
  make
}

package() {
  cd ${pkgname}-${pkgver}
  if [ ! -e "${pkgdir}/usr/bin" ]; then
    mkdir -p "${pkgdir}/usr/bin"
  fi
  cp build/qwebapp "${pkgdir}/usr/bin"
}

# vim: ts=2 sw=2 et:
