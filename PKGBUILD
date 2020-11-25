# Maintainer: dekzi <dekzi dev at proton mail dot com>

pkgname=dde-store
pkgver=1.0.1
pkgrel=1
arch=(x86_64)
pkgdesc="An app store for DDE built with DTK"
url="https://github.com/dekzi/dde-store"
license=('GPL3')
depends=("qt5-base" "dtkwidget" "packagekit-qt5" "appstream-qt" "archlinux-appstream-data")
makedepends=("cmake" "qt5-tools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dekzi/dde-store/archive/$pkgver.tar.gz")
md5sums=('7f18997f99bea342de310bfcabe50d9d')

build() {
  cd $pkgname-$pkgver
  cmake .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
