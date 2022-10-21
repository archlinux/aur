# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-settings
pkgver=0.8
pkgrel=3
pkgdesc="System Settings application for Cutefish Desktop"
arch=('x86_64')
url="https://github.com/cutefishos/settings"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'fontconfig' 'freetype2' 'icu' 'kcoreaddons' 'libxcursor'
         'modemmanager-qt' 'networkmanager-qt'
         # qml:
         'bluez-qt' 'bluedevil' 'libcutefish' 'qt5-quickcontrols')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/settings/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('abb724e999b0f339cd90a36efef3ce4249da24a186c33d026ac1ca30c858b702025d0b8e3fe7f0116b2cc0d217917b7ce1257c8f255b7ca4b8593c2031805e9c')

build() {
  cd settings-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd settings-$pkgver
  make DESTDIR="$pkgdir" install
}
