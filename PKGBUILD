# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-pgsql
_project=gawkextlib
pkgver=1.1.1
pkgrel=1
pkgdesc="GAWK extension - interface to libpq from PostgreSQL"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('postgresql-libs' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('b5aaade8048b5d60887a553dad893d57')
sha256sums=('5f7763d9064e36edcdb7aa0e8e0505499bd10e31a5d9fb9614319ba67959fc83')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
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
