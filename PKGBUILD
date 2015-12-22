# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=andi
pkgver=0.9.5
pkgrel=1
pkgdesc="Rapid estimation of evolutionary distances"
url="https://github.com/evolbioinf/andi/"
license=("GPL3") # "custom:ISC" "custom:CC-BY 4.0"
depends=("libdivsufsort" "gsl")
arch=("i686" "x86_64")
checkdepends=("glib2")
source=("https://github.com/EvolBioInf/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha1sums=("9dcf3233c2cdf9d3fc229621bb365cb7c385e34c")

check() {
    cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-unit-tests
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
