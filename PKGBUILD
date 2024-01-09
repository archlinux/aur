# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libglibutil
pkgver=1.0.75
pkgrel=1
pkgdesc="Library of glib utilities"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/sailfishos/libglibutil"
license=('BSD')
depends=('glib2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sailfishos/libglibutil/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('2b66d0360c803b37c01e6db29f121dc1b4e5a50cec57f1d6943137782a192f49f7c1a4326ff7c20feca13478b13b63624200372e74bb938f570446bac6f674cc')

build() {
  cd $pkgname-$pkgver
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}
