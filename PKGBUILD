# maintainer: luka null <lukadevnull@vivaldi.net>
pkgname=pg_background
pkgver=2.0.5
pkgrel=1
pkgdesc='Execute arbitrary SQL in background worker processes for PostgreSQL'
arch=('x86_64')
url='https://github.com/vibhorkum/pg_background'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('make' 'gcc' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e636c280b7455cdec822f8d97a386ab584ec527015d10462f8d80d20454fcc51')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
