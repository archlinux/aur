# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=libmurmurhash
pkgver=1.3
pkgrel=1
pkgdesc="Portable MurmurHash Implementation"
url="https://github.com/kloetzl/libmurmurhash/"
license=("custom:publicdomain")
arch=("i686" "x86_64")
source=("https://github.com/kloetzl/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('67e70b977f128666d85ab97e54240620df56845243cd0148a0b9d3470e03dfe1')

check() {
	cd "${pkgname}-${pkgver}"
	make
	make check
}

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

