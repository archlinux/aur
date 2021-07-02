# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-select
_project=gawkextlib
pkgver=1.1.2
pkgrel=1
pkgdesc="GAWK extension - supports I/O multiplexing and signal trapping"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('1d352f739e3be9ca7010d7b2c7b90bcc')
sha256sums=('2a2e9dbb34f45086df86c60ab002814ad297a32a9caabef700f583a9ff8d661f')

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
