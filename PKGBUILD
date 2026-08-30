# maintainer: luka null <lukadevnull@vivaldi.net>
pkgname=pg_background
pkgver=2.0.3
pkgrel=1
pkgdesc='Execute arbitrary SQL in background worker processes for PostgreSQL'
arch=('x86_64')
url='https://github.com/vibhorkum/pg_background'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('make' 'gcc' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e23efe644a8e9ecf7bc07b626f6f7fd9a6b7a1278907db56071b7cbcb0b7cb77')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
