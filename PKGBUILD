# Contributor: Vojtech Horky <AUR / hotspur>
# Maintainer: Vojtech Horky <AUR / hotspur>
pkgname=msim
pkgver=2.3.1
pkgrel=1
pkgdesc="Light-weight MIPS R4000 and RISC-V system simulator"
url="https://d3s.mff.cuni.cz/software/msim/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('readline')
makedepends=('imake')
source=("https://github.com/d-iii-s/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ae2bdfb814ee299d590f89fac960e919026f0af50fabbfeda9ca71cd50e53d6a')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
