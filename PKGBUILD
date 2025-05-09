# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libglibutil
pkgver=1.0.80
pkgrel=1
pkgdesc="Library of glib utilities"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/sailfishos/libglibutil"
license=('BSD-3-Clause')
depends=('glib2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sailfishos/libglibutil/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('8dea9bae8d06e01e23ae10fa0b4f853f65eca697df243a8ed99233cde3bdcecea7aefcc253095201c39acb94541bf9b948b1fad622fdab87dea002128209bc7a')

build() {
  cd $pkgname-$pkgver
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}
