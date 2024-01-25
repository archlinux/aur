# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-pgsql
_project=gawkextlib
pkgver=1.1.2
pkgrel=1
pkgdesc="GAWK extension - interface to libpq from PostgreSQL"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gawkextlib' 'glibc' 'postgresql-libs')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('df8890672e9eab11f90e2c6046972b3c')
sha256sums=('a258385265ce254c967cf47ad9288a65f5b5d40c626911dfab78fac3e344f170')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-silent-rules
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
