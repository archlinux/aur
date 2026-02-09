# maintainer: luka null <lukadevnull@vivaldi.net>
# old maintainer: Alexey Kh <aur@devass.club>
pkgname=pg_textsearch
pkgver=0.5.0
pkgrel=1
pkgdesc='Modern ranked full-text search for PostgreSQL (BM25)'
arch=('x86_64')
url='https://github.com/timescale/pg_textsearch'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('414312234bc7422bbc1c237cf94329c17cc0165a2d59c14045ad8adade381cad')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
