# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=libmurmurhash
pkgver=1.2.1
pkgrel=1
pkgdesc="Portable MurmurHash Implementation"
url="https://github.com/kloetzl/libmurmurhash/"
license=("custom:publicdomain")
arch=("i686" "x86_64")
source=("https://github.com/kloetzl/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9058f03a1cdd975c2d71a7172a0881a9ec679376eda50d5b1b8b866bc579847e')

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

