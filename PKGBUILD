# Maintainer: pappy <pa314159@users.noreply.github.com>

pkgname=pg_cron
pkgver=1.6.2
pkgrel=1
pkgdesc='Run periodic jobs in PostgreSQL'
arch=('x86_64' 'armv5h' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
url='https://github.com/citusdata/pg_cron/'
depends=('postgresql-libs')
makedepends=('postgresql' 'clang15' 'llvm15')
source=("$pkgname-$pkgver.tar.gz::https://github.com/citusdata/pg_cron/archive/v${pkgver}.tar.gz")
sha512sums=('4202f0a35c07d090be817284ff518d97e31ea9860c0e0b0ac9657539b1e5695a03246faa9c2bb793abdf2b971ec0792732fcf43b06bb94537272a613e6bd91ba')

build()
{
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
