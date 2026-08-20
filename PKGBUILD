# maintainer: luka null <lukadevnull@vivaldi.net>
# old maintainer: Alexey Kh <aur@devass.club>
pkgname=pg_textsearch
pkgver=1.4.0
pkgrel=1
pkgdesc='Modern ranked full-text search for PostgreSQL (BM25)'
arch=('x86_64')
url='https://github.com/timescale/pg_textsearch'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('make' 'gcc' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cab02b4e8af11f98b428d17cca9c5235ab55e12d79c20fa8fbb950708c4a1e92')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
