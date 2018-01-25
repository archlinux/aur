# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-errno
_project=gawkextlib
pkgver=1.1.0
pkgrel=1
pkgdesc="GAWK extension - convert errno values to strings and vice versa"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gawkextlib')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('126188cedf0c8756e4bf5cda94fed1b3')
sha256sums=('973b0174836fe9d39bc2f87b42e0076f6cf522d2fc4725a9adf95b85976cb37c')

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
