# Maintainer: pappy <pa314159@users.noreply.github.com>

pkgname=pg_cron
pkgver=1.4.2
pkgrel=1
pkgdesc='Run periodic jobs in PostgreSQL'
arch=('x86_64' 'armv5h' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
url='https://github.com/citusdata/pg_cron/'
depends=('postgresql-libs')
makedepends=('postgresql' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/citusdata/pg_cron/archive/v${pkgver}.tar.gz")
sha512sums=('2742f9e146dc00e210c9d42cf1760d251e55887117548e95b86fc54397cefd23d080da4c25e2fd07b1fb569c57a70a200f74884157dd27a51084378ff39362ec')

build()
{
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
