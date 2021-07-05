# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=phylonium
pkgver=1.5
pkgrel=1
pkgdesc="Fast and Accurate Estimation of Evolutionary Distances"
url="https://github.com/evolbioinf/phylonium/"
license=("GPL3") # "custom:ISC"
depends=("libdivsufsort")
arch=("i686" "x86_64")
checkdepends=("glib2")
source=("https://github.com/EvolBioInf/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a84d738ba7a265d0da0d8178255810923f4aa76bf50253e727c46961805ca6a4')

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
