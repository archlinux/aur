# Maintainer: Jason Kercher <jkercher43 at gmail>
pkgname=stdcsv
pkgver=1.0
pkgrel=1
pkgdesc="A tool/library for working with delimited files."
arch=(x86_64)  # It is only tested on x86_64
url="https://github.com/jasonKercher/libcsv"
license=(MIT)
checkdepends=(check)
provides=(libcsv.so)
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=(f55dd16fb53db59ccdff4ed0c00f97e1)

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
	make DESTDIR="$pkgdir/" install
}
