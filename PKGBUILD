pkgname=umsfuse
pkgver=1.1.1
pkgrel=1
pkgdesc="FUSE driver and programs for UMSDOS"
arch=('x86_64')
url="https://fossil.chungy.name/umsfuse"
license=('ISC')
depends=('fuse3')
makedepends=('texinfo')
checkdepends=('python')
source=("${url}/tarball/version-${pkgver}/umsfuse-${pkgver}.tar.gz")
b2sums=('082cd7de9072cbb764ed8229b43df073a95fbfe6bed3c14fbe4d2829ea1486158845f7f8dbb3325e9f05c7ae7a3e84e28a0a16aa46eaadf2abce9a347a441c4f')

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
