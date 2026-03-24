# maintainer: luka null <lukadevnull@vivaldi.net>
pkgname=pg_background
pkgver=1.8
pkgrel=1
pkgdesc='Execute arbitrary SQL in background worker processes for PostgreSQL'
arch=('x86_64')
url='https://github.com/vibhorkum/pg_background'
license=('PostgreSQL')
depends=('postgresql')
makedepends=('make' 'gcc' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('84982716bf19efb3c4298222aa9287548499f79961f3eb389df847416b82456b')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
