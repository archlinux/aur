pkgname=umsfuse
pkgver=1.1.0
pkgrel=1
pkgdesc="FUSE driver and programs for UMSDOS"
arch=('x86_64')
url="https://fossil.chungy.name/umsfuse"
license=('ISC')
depends=('fuse3')
makedepends=('texinfo')
checkdepends=('python')
source=("${url}/tarball/version-${pkgver}/umsfuse-${pkgver}.tar.gz")
b2sums=('f93d3115e15ba3cd641191681347f6dc307bb755b6e40d37df205ba705cf3bc6114e252e18a51359c6b44ac378ea0576f6341247a793e2e50fc31039ff36ba93')

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
