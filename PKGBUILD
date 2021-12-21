# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-settings
pkgver=0.5
pkgrel=1
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
sha512sums=('830866aa38ea71c5bac1dd28b178237a93bcb388a8f1c1be2896eb86f43ed3c2dd1b80cca3a70c6c6cd7c729179e0d7b2ce4d6efd1e0aaac7deafcf07397058c')

build() {
  cd settings-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd settings-$pkgver
  make DESTDIR="$pkgdir" install
}
