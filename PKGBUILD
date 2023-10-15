# Maintainer: Patrick Kurth <p.kurth@posteo.de>
pkgname=xschem
pkgver="3.4.4"
pkgrel=1
pkgdesc="Schematic editor VLSI/ASIC/analog custom designs"
arch=('any')
url="http://github.com/StefanSchippers/xschem"
source=("http://repo.hu/projects/xschem/releases/xschem-$pkgver.tar.gz")
sha256sums=('4d40c8bf5be6d644cd0875249357196dd6276d03e2ff9aa9208069d6a52c980b')
depends=('libx11' 'libxrender' 'libxcb' 'cairo' 'tcl' 'tk' 'libxpm' 'gawk')
makedepends=('flex' 'bison')
license=('GPL')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}

