pkgname=umsfuse
pkgver=1.0.0
pkgrel=1
pkgdesc="FUSE driver and programs for UMSDOS"
arch=('x86_64')
url="https://fossil.chungy.name/umsfuse"
license=('ISC')
depends=('fuse3')
makedepends=('texinfo')
checkdepends=('python')
source=("${url}/tarball/version-${pkgver}/umsfuse-${pkgver}.tar.gz")
b2sums=('9e118094e3ff4943e4e8ee2ceb24748ffa6700ce47eb176fc20fda9f1c41a01d2be4d9e771206aacf5dbe2ce8a5443525a5ee5df3750d22bdcfb33cf0915ef4c')

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
