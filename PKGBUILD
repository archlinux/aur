# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=libcutefish
pkgver=0.1
pkgrel=1
pkgdesc="System library for Cutefish applications"
arch=('x86_64')
url="https://github.com/cutefishos/libcutefish"
license=('GPL')
depends=('kscreen' 'modemmanager-qt' 'networkmanager-qt' 'qt5-quickcontrols2')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/libcutefish/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ec38d3adaeda9b6bc99d71eee3f6a186b86be18d157353585bbcf39d5ac3da0f3830115574823b197cdf7e39ca698bf683c5c1b21f8e40ebdfe688870c210537')

build() {
  cd $pkgname-$pkgver

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
