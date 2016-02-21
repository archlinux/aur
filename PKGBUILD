# Maintainer: drakkan <nicola.murino@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>

pkgname=pg_repack
pkgver=1.3.3
pkgrel=1
pkgdesc="Reorganize tables in PostgreSQL databases with minimal locks (fork of pg_reorg)"
arch=(i686 x86_64)
url="http://reorg.github.com/pg_repack/"
license=('BSD')
depends=('postgresql-libs')
makedepends=('postgresql')
source=("https://github.com/reorg/pg_repack/archive/ver_${pkgver}.tar.gz")
	

md5sums=('6cdec5636ff95649f91d812f70fd4ad4')

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

