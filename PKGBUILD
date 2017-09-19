# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-pgsql
_project=gawkextlib
pkgver=1.0.2
pkgrel=1
pkgdesc="GAWK extension - interface to libpq from PostgreSQL"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('postgresql-libs' 'gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('d3b8f79af421f8d171e6cf1eee9cbb98')
sha256sums=('bbd22ad7952753e86297307f4d09bcf39bf8b0b5e06a9db2e9f455a4a4571858')

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
