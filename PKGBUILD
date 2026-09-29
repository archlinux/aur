# maintainer: luka null <lukadevnull@vivaldi.net>
pkgname=pg_background
pkgver=2.0.4
pkgrel=1
pkgdesc='Execute arbitrary SQL in background worker processes for PostgreSQL'
arch=('x86_64')
url='https://github.com/vibhorkum/pg_background'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('make' 'gcc' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('353db32a48661ff4c052cea454aea4791aa265425bf01b5ecc3f50e4990190d7')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
