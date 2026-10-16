# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libsafec
pkgver=3.15
pkgrel=1
epoch=1
pkgdesc='Implementation of C11 Annex K + ISO TR24731 Bounds Checking Interface'
license=('MIT')
arch=('i686' 'x86_64')
url='https://github.com/rurban/safeclib'
depends=('perl')
makedepends=('doxygen')
provides=("$pkgname.so=3-64")
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/safeclib-$pkgver.tar.xz")
sha256sums=('55af946855f77f72769cb833d3b2b4c39e162569bd2c431236ae08da9aabc54c')

build() {
  cd "safeclib-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "safeclib-$pkgver"
  make check
}

package() {
  cd "safeclib-$pkgver"
  DESTDIR="$pkgdir/" make install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
