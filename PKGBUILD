# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=bmk
pkgver=0.2
pkgrel=1
pkgdesc="successor to make(1) with support for subdirectories"
arch=(x86_64 aarch64)
url="https://github.com/realchonk/bmk"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('63fb5179edc749067dc2771fe8049b5abcdf28217d71f947d382cb32e4ba3f4e')
license=('ISC')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
