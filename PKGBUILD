# Maintainer: Jason Kercher <jkercher43 at gmail>
pkgname=stdcsv
pkgver=1.0
pkgrel=1
#epoch=
pkgdesc="A tool/library for working with delimited files."
arch=(x86_64)  # It is only tested on x86_64
url="https://github.com/jasonKercher/libcsv"
license=(MIT)
groups=()
depends=()
makedepends=()
checkdepends=(check)
optdepends=()
provides=(libcsv.so)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/jasonKercher/libcsv/releases/download/1.0/libcsv-1.0.tar.gz")
noextract=()
md5sums=(a5bdb8eed61d3fa16ca88762447f5d30)
validpgpkeys=()

prepare() {
	true
}

build() {
	cd "libcsv-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "libcsv-$pkgver"
	make -k check
}

package() {
	cd "libcsv-$pkgver"
	sudo make install
}
