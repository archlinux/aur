# Maintainer: lantw44 (at) gmail (dot) com

pkgname=qelly
_pkgname=Qelly
pkgver=1.0b
pkgrel=3
pkgdesc="Beautiful cross-platform BBS client"
arch=('x86_64' 'i686')
url="https://github.com/uranusjr/Qelly"
license=('GPL3')
depends=('qt4' 'libqxt')
makedepends=()
conflicts=('qelly')
provides=('qelly')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uranusjr/Qelly/archive/v${pkgver}.tar.gz")
sha256sums=('186333debd9f2eba1465eac94fcf59543868dbd8aae04e2f9a56a45ed9817479')

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
