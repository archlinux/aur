# Maintainer: Patrick Kurth <p.kurth@posteo.de>
pkgname=xschem
pkgver="3.1.0"
pkgrel=1
pkgdesc="Schematic editor VLSI/ASIC/analog custom designs"
arch=('any')
url="http://github.com/StefanSchippers/xschem"
source=("http://repo.hu/projects/xschem/releases/xschem-$pkgver.tar.gz")
sha256sums=('50cc069e3256197cecbab0044aabff985eca0eb92be431bd3c0d5e41feb3f509')
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

