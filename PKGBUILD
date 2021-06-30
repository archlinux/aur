# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-settings
pkgver=0.3
pkgrel=1
pkgdesc="System Settings application for Cutefish Desktop"
arch=('x86_64')
url="https://github.com/cutefishos/settings"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'fontconfig' 'freetype2' 'icu' 'kcoreaddons' 'libcutefish' 'modemmanager-qt' 'networkmanager-qt')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/settings/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e25fe45a2140a18780d53947bd41a44a90ae1425fbd7af09b2000f0712a9489b00fe855c64efee4aa7d558b10f1e62cc1d6dbc6ac4f8e3dc5d38d6f17aa14588')

build() {
  cd settings-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd settings-$pkgver
  make DESTDIR="$pkgdir" install
}
