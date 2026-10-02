# maintainer: luka null <lukadevnull@vivaldi.net>
# old maintainer: Alexey Kh <aur@devass.club>
pkgname=pg_textsearch
pkgver=1.5.1
pkgrel=1
pkgdesc='Modern ranked full-text search for PostgreSQL (BM25)'
arch=('x86_64')
url='https://github.com/timescale/pg_textsearch'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('make' 'gcc' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2e7fb76ed96176afc6d16cc5d095ced2cb233ff27fbeaa8c7bfffc82e02f7498')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
