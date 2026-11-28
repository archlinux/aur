pkgname=ufatfs
pkgver=1.0.0
pkgrel=1
pkgdesc="Unix overlay file system for VFAT/exFAT"
arch=('x86_64')
url="https://fossil.chungy.name/ufatfs"
license=('ISC')
depends=('fuse3')
makedepends=('texinfo')
source=("${url}/tarball/version-${pkgver}/ufatfs-${pkgver}.tar.gz")
b2sums=('e4fd0c14b8cafeb521c0bde2be579263c6305f21fb170cfc6da9e7c095a6e376c5c818b4118a6b0d29fd8322ec4469de52d2587ac3ae1dbbe0201f0f3381b6f9')

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
