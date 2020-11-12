# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=phylonium
pkgver=1.3
pkgrel=1
pkgdesc="Fast and Accurate Estimation of Evolutionary Distances"
url="https://github.com/evolbioinf/phylonium/"
license=("GPL3") # "custom:ISC"
depends=("libdivsufsort")
arch=("i686" "x86_64")
checkdepends=("glib2")
source=("https://github.com/EvolBioInf/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7a31abfa9c598f4080de4cddbb2e0ee70b80ba6f77769a6d00915929b0472aac')

prepare() {
	cd "${pkgname}-${pkgver}"
}

check() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
	make check
}

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
