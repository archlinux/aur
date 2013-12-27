# Maintainer: lantw44 (at) gmail (dot) com

pkgname=qelly
_pkgname=Qelly
pkgver=1.0b
pkgrel=1
pkgdesc="Beautiful cross-platform BBS client"
arch=('x86_64' 'i686')
url="https://github.com/uranusjr/Qelly"
license=('GPL')
depends=('qt4' 'libqxt')
makedepends=()
conflicts=('qelly')
provides=('qelly')
source=("https://github.com/uranusjr/Qelly/archive/v${pkgver}.tar.gz")
md5sums=('0b0b142504b7aa43bf94e50cf9b38d3f')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	qmake-qt4
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	install -m 755 "bin/Qelly" "${pkgdir}/usr/bin"
}
