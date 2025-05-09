# Maintainer: Danct12 <danct12@disroot.org>

pkgname=libgbinder
pkgver=1.1.42
pkgrel=2
pkgdesc="GLib-style interface to binder"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mer-hybris/libgbinder.git"
license=('BSD-3-Clause')
depends=('libglibutil' 'glib2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mer-hybris/libgbinder/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('4d229e957188064817d6b40f693cf6fe9b44efae34ad15ac4314c7f0e3c49dc17835984fa741f7b90d8a2016234f2e7e78cc56f73625156e2aedab73faa93553')

build() {
  cd $pkgname-$pkgver
  CFLAGS="-Wno-incompatible-pointer-types ${CFLAGS}" \
    make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd $pkgname-$pkgver
  make install-dev DESTDIR="${pkgdir}"
}
