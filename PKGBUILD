# maintainer: luka null <lukadevnull@vivaldi.net>
pkgname=pg_background
pkgver=2.0.2
pkgrel=1
pkgdesc='Execute arbitrary SQL in background worker processes for PostgreSQL'
arch=('x86_64')
url='https://github.com/vibhorkum/pg_background'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('make' 'gcc' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b3bacb0f83b762ae92310d13f17e4e21f55cafb3a4f5a46f599de6a0a06cd8ee')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
