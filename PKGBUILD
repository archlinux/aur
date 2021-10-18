# Maintainer: Jason Kercher <jkercher43 at gmail>
pkgname=stdcsv
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool/library for working with delimited files."
arch=(x86_64)  # It is only tested on x86_64
url="https://github.com/jasonKercher/libcsv"
license=(MIT)
checkdepends=(check)
provides=(libcsv.so)
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=(638cae31d2257a7cf6516c715da003e8)

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
