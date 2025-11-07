# Maintainer: pappy <pa314159@users.noreply.github.com>

pkgname=pg_cron
pkgver=1.6.7
pkgrel=1
pkgdesc='Run periodic jobs in PostgreSQL'
arch=(x86_64 armv5h armv6h armv7h aarch64)
license=(MIT)
url=https://github.com/citusdata/pg_cron/
depends=(postgresql-libs)
makedepends=(postgresql clang llvm)
source=("$pkgname-$pkgver.tar.gz::https://github.com/citusdata/pg_cron/archive/v${pkgver}.tar.gz")
sha512sums=('e3274d7223f7b5c297595397273bd3a9152c43b773b8006feb22b0be74b25b8248d6ea39cebebf2fe4bf7db63dbd74269f86d8422ecf2b4b38d815b222562d1a')

build()
{
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
