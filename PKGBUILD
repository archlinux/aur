# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=phylonium
pkgver=1.2
pkgrel=1
pkgdesc="Fast and Accurate Estimation of Evolutionary Distances"
url="https://github.com/evolbioinf/phylonium/"
license=("GPL3") # "custom:ISC"
depends=("libdivsufsort" "gsl")
arch=("i686" "x86_64")
checkdepends=("glib2")
source=("https://github.com/EvolBioInf/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('480bb1409cb335498d53e176bfa0b5721f3a417d5de8cfcca935815f1010f4be')

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
