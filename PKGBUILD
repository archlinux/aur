# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=andi
pkgver=0.9.4
pkgrel=1
pkgdesc="Rapid estimation of evolutionary distances"
url="https://github.com/evolbioinf/andi/"
license=("GPL3") # "custom:ISC" "custom:CC-BY 4.0"
depends=("libdivsufsort")
arch=("i686" "x86_64")
checkdepends=("glib2")
source=("https://github.com/EvolBioInf/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha1sums=("24783d35bb1f4083d40982bd13823294a273007a")

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
