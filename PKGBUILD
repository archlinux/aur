# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot
pkgver=1
pkgrel=1
pkgdesc='Emulating syscall chroot in an unpriviliged process'
arch=('x86_64')
url="https://github.com/gportay/$pkgname"
license=('GPL')
makedepends=('asciidoctor')
source=("https://github.com/gportay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('96105f40d8c94b4bdaf8edff0bacd22a5609a6db0388b8dda3c930d38dc60d46')

build() {
	cd "$pkgname-$pkgver"
	make libiamroot.so doc
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
