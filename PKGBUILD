# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-select
_project=gawkextlib
pkgver=1.1.4
pkgrel=1
pkgdesc="GAWK extension - supports I/O multiplexing and signal trapping"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gawkextlib' 'glibc')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz")
md5sums=('c2ec792dbd81edb1562ada8a56e603c5')
sha256sums=('35fbaf4180851c9230dc2fa5272b669d77842ee4bfedbbdbb534e92219f99bcd')

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
