# Maintainer: dekzi <dekzi dev at proton mail dot com>

pkgname=dde-store
pkgver=1.1.0
pkgrel=1
arch=(x86_64)
pkgdesc="An app store for DDE built with DTK"
url="https://github.com/dekzi/dde-store"
license=('GPL3')
depends=("qt5-base" "dtkwidget" "packagekit-qt5" "appstream-qt" "archlinux-appstream-data")
makedepends=("cmake" "qt5-tools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dekzi/dde-store/archive/$pkgver.tar.gz")
md5sums=('32cd4867ea3c15b10279e8f4363c7fe1')

build() {
  cd $pkgname-$pkgver
  cmake .
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
