# Contributor: Vojtech Horky <AUR / hotspur>
# Maintainer: Vojtech Horky <AUR / hotspur>
pkgname=msim
pkgver=2.2.1
pkgrel=1
pkgdesc="Light-weight computer simulator based on MIPS R4000 and RISC-V"
url="https://d3s.mff.cuni.cz/software/msim/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('readline')
makedepends=('imake')
source=("https://github.com/d-iii-s/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('a806527cb017f5cec8b3d1eacf7353e1')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
