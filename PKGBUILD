# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: Marti Raudsepp <marti at juffo dot org>

pkgname=pg_repack
pkgver=1.4.4
pkgrel=1
pkgdesc="Reorganize tables in PostgreSQL databases with minimal locks (fork of pg_reorg)"
arch=(i686 x86_64)
url="http://reorg.github.com/pg_repack/"
license=('BSD')
depends=('postgresql-libs')
makedepends=('postgresql')
source=("https://github.com/reorg/pg_repack/archive/ver_${pkgver}.tar.gz")
sha256sums=('b9f00d6e0b4d39460670610719d9e5510273b1396b18f2f2a5d35e080bcde255')

prepare() {
  cd "$srcdir/$pkgname-ver_$pkgver"
}

build() {
  cd "$srcdir/$pkgname-ver_$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-ver_$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/pg_repack/COPYRIGHT
}

