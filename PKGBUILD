# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=phylonium
pkgver=1.6
pkgrel=1
pkgdesc="Fast and Accurate Estimation of Evolutionary Distances"
url="https://github.com/evolbioinf/phylonium/"
license=("GPL3") # "custom:ISC"
depends=("libdivsufsort")
arch=("i686" "x86_64")
checkdepends=("glib2")
source=("https://github.com/EvolBioInf/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5618819e12141c2e9005e1d6e83426c05bd9f035289a65b0f3199bbcbb8f632c')

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
