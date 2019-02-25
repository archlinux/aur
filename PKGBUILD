# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=genkfs
pkgver=1.2.2
pkgrel=1
license=('MIT')
pkgdesc='Builds KFS filesystems for KnightOS'
makedepends=("cmake" "asciidoc")
arch=("i386" "x86_64")
url='https://github.com/KnightOS/genkfs'
source=("https://github.com/KnightOS/genkfs/archive/${pkgver}.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir/" make install
}
md5sums=('2a1875411dfc5790caf45c99b5628fc0')
