# Maintainer: László Várady <laszlo.varady93@gmail.com>

pkgname=ivykis
pkgver=0.42.3
pkgrel=1
pkgdesc="Asynchronous I/O readiness notification library"
arch=('x86_64')
url="https://github.com/buytenh/ivykis"
license=('LGPL2.1')
conflicts=('libivykis' 'libivykis-git')
source=("https://downloads.sourceforge.net/project/lib$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c9b025d55cefe9c58958d1012f36d63aa0a5caf22075617fff648751ea940aec')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make --keep-going check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
