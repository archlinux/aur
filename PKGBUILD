# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=wrapsix
pkgver=0.2.1
pkgrel=1
pkgdesc="Fast userspace NAT64 daemon for Linux"
arch=('x86_64')
url="https://www.wrapsix.org/"
license=('GPL3')
backup=('etc/wrapsix.conf')
source=("https://www.wrapsix.org/download/wrapsix-${pkgver}.tar.bz2")
sha512sums=('efac69a470e83cb585ad5649a782c6b42bb2d577e9a1ec5b9787a0eb19162c332d417a7d6767f8db8268dfc3e42a83c503dd4e656409f26a913b6619e25a6dd9')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
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
