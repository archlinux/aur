# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

pkgname=pg_cron
pkgver=1.2.0
pkgrel=1
pkgdesc='Run periodic jobs in PostgreSQL'
arch=('x86_64' 'armv5h' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
url='https://github.com/citusdata/pg_cron/'
depends=('postgresql-libs')
makedepends=('postgresql' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/citusdata/pg_cron/archive/v${pkgver}.tar.gz")
sha512sums=('fe11fc42fa8d3de4ff08440f96bcc5c228408ae01f7c1cf676d8dbab6ebef9aa0496aa3d5e785ec850eee3b484dc7ec0bf930a9c09e4267d10375adb9027f0b1')

build()
{
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
