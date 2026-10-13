# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libsafec
pkgver=3.14
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
sha256sums=('065e666fde31194643317ceefcddb92e08e4c42213987b525df0f60b07a82029')

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
