# Maintainer: pappy <pa314159@users.noreply.github.com>

pkgname=pg_cron
pkgver=1.6.5
pkgrel=1
pkgdesc='Run periodic jobs in PostgreSQL'
arch=(x86_64 armv5h armv6h armv7h aarch64)
license=(MIT)
url=https://github.com/citusdata/pg_cron/
depends=(postgresql-libs)
makedepends=(postgresql clang llvm)
source=("$pkgname-$pkgver.tar.gz::https://github.com/citusdata/pg_cron/archive/v${pkgver}.tar.gz")
sha512sums=('f7308ae411ff5389dd2270db4092e649756ce0dd6f54b92024513534914ffd55da75dd3acbf5dcf52f052c24a7204cd10aa687436dc9fe0daee6041c7bcc9630')

build()
{
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
