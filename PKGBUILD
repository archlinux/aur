pkgname=ufatfs
pkgver=0.1.0
pkgrel=1
pkgdesc="Unix overlay file system for VFAT/exFAT"
arch=('x86_64')
url="https://fossil.chungy.name/ufatfs"
license=('ISC')
depends=('fuse3')
makedepends=('texinfo')
source=("${url}/tarball/version-${pkgver}/ufatfs-${pkgver}.tar.gz")
b2sums=('9911455ab7ccc49dd9c551aa0a78c8c1183a954277b22b3f3387494a1579c7861b0f76e916ddb6d5f1420e1e25a0b9f5e265c4956614044dbcd9d6d839918bb8')

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
