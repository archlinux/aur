# Maintainer: Benjamin James <benjamin-james@utulsa.edu>

pkgname=brainfuck
pkgver=0.1
pkgrel=1
pkgdesc="A full fledged brainfuck compiler"
arch=('any')
url="https://github.com/benjamin-james/brainfuck"
license=('GPL3')
depends=('glibc' 'binutils')
provides=('bfc')
source=(https://github.com/benjamin-james/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('22dd272219ee951739937f1548c4448d')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	  cd "${pkgname}-${pkgver}"
	  make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
