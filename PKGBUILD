# Maintainer: dekzi <dekzi dev at proton mail dot com>

pkgname=dde-store
pkgver=1.0.0
pkgrel=1
arch=(x86_64)
pkgdesc="An app store for DDE built with DTK"
url="https://github.com/dekzi/dde-store"
license=('GPL3')
depends=("qt5-base" "packagekit-qt5" "appstream-qt" "archlinux-appstream-data")
makedepends=("cmake" "qt5-tools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dekzi/dde-store/archive/$pkgver.tar.gz")
md5sums=('9dc601aa91bceda42f571b903e9d3a6d')

build() {
  cd $pkgname-$pkgver
  cmake .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
