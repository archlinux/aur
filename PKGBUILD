# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libgbinder
pkgver=1.1.43
pkgrel=1
pkgdesc="GLib-style interface to binder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mer-hybris/libgbinder.git"
license=('BSD-3-Clause')
depends=('libglibutil' 'glib2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mer-hybris/libgbinder/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('c0c2de4cbcd8b7609781cdb888390ea28c763c3eeee658f8559604b9bb10dda1bab982c1eb5a432b53643848e6436cf2d1b4fda7b3cd31fecc02f7a15c71f197')

build() {
  cd $pkgname-$pkgver
  CFLAGS="-Wno-incompatible-pointer-types ${CFLAGS}" \
    make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}
