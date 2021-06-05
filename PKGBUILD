# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-settings
pkgver=0.2
pkgrel=1
pkgdesc="System Settings application for Cutefish Desktop"
arch=('x86_64')
url="https://github.com/cutefishos/settings"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'fontconfig' 'freetype2' 'icu' 'kcoreaddons' 'libcutefish' 'modemmanager-qt' 'networkmanager-qt')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/settings/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1fa0eccc2492b91c71d71f0fb3af08e56f6433353b1a3c1bbb0018fb58921d76a4ab2c6b71c437fbbea46faed312c9a2c7aa84ccbb684aab381ee38c5d6b6fcb')

build() {
  cd settings-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd settings-$pkgver
  make DESTDIR="$pkgdir" install
}
