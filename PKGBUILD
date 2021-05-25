# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-settings
pkgver=0.1
pkgrel=2
pkgdesc="System Settings application for Cutefish Desktop"
arch=('x86_64')
url="https://github.com/cutefishos/settings"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'fontconfig' 'freetype2' 'icu' 'kcoreaddons' 'libcutefish' 'modemmanager-qt' 'networkmanager-qt')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/settings/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('086708f1090acd4d7f282eed4d046b42e3cc8b9d2c5dbed505ff540bda726643c042e668f9e7aa98483d4b01dc2e089d836c3ebcda3f484cdd902e5f01036d6a')

build() {
  cd settings-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd settings-$pkgver
  make DESTDIR="$pkgdir" install
}
