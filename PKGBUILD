# Maintainer: lantw44 (at) gmail (dot) com

pkgname=qelly
_pkgname=Qelly
pkgver=1.0a2
pkgrel=1
pkgdesc="Qelly is a Qt port of Nally"
arch=('x86_64' 'i686')
url="https://github.com/uranusjr/Qelly"
license=('GPL')
depends=('qt4' 'libqxt')
makedepends=()
conflicts=('qelly')
provides=('qelly')
source=("https://github.com/uranusjr/Qelly/archive/v${pkgver}.tar.gz")
md5sums=('0a575a62889a3aec2d356932a92ced29')

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
