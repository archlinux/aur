# Maintainer: lantw44 (at) gmail (dot) com

pkgname=qelly
_pkgname=Qelly
pkgver=1.0a3
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
md5sums=('3a50df49d8e7cb5ff075145aeeab5214')

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
