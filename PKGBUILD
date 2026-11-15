pkgname=umsfuse
pkgver=1.2.0
pkgrel=1
pkgdesc="FUSE driver and programs for UMSDOS"
arch=('x86_64')
url="https://fossil.chungy.name/umsfuse"
license=('ISC')
depends=('fuse3')
makedepends=('texinfo')
checkdepends=('python')
source=("${url}/tarball/version-${pkgver}/umsfuse-${pkgver}.tar.gz")
b2sums=('2bcb5c48c9c9f3782b2ced143989f7a2eb198b3e3032a2fd228d4e8041fd74b80a9a812171b1ebd065d2a1b22016e73eea38cdede2d52c7e1cb02067accd5a93')

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
