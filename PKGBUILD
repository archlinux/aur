# Contributor: Vojtech Horky <AUR / hotspur>
# Maintainer: Vojtech Horky <AUR / hotspur>
pkgname=msim
pkgver=3.0.1
pkgrel=1
pkgdesc="Light-weight MIPS R4000 and RISC-V system simulator"
url="https://d3s.mff.cuni.cz/software/msim/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('readline')
makedepends=('imake')
source=("https://github.com/d-iii-s/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3130aa8d55478092a8ed3e1fea4afd009841ee06e4d5425fa54d6eced4c84007')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
