# maintainer: luka null <lukadevnull@vivaldi.net>
# old maintainer: Alexey Kh <aur@devass.club>
pkgname=pg_textsearch
pkgver=1.3.1
pkgrel=1
pkgdesc='Modern ranked full-text search for PostgreSQL (BM25)'
arch=('x86_64')
url='https://github.com/timescale/pg_textsearch'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('make' 'gcc' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2ef1f8ea3d9bdef638e64cd844d37790ad27dc53e6bebdb2ad36e549fc5e671f')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
