# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

pkgname=pg_cron
pkgver=1.3.1
pkgrel=1
pkgdesc='Run periodic jobs in PostgreSQL'
arch=('x86_64' 'armv5h' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
url='https://github.com/citusdata/pg_cron/'
depends=('postgresql-libs')
makedepends=('postgresql' 'clang' 'llvm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/citusdata/pg_cron/archive/v${pkgver}.tar.gz")
sha512sums=('e9758e1c3dfa12be05a9a24060d46a90299a821e0067690f07ea3356faade5fb3c157259aa553bbdb0fdb5582baedc8e51fb119ea0e78a5c88fb8bd3e6d047a6')

build()
{
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
