# Maintainer: Vinicius Almada <viniciusalmada10@gmail.com>

pkgname=cd-bin
pkgver=5.14
pkgrel=1
epoch=0
pkgdesc="A vector graphics toolkit with device independent output. Pre-compiled."
arch=('x86_64')
url="https://www.tecgraf.puc-rio.br/cd/"
license=('MIT')
conflicts=('iup' 'libcd')
options=(!strip)
source=(
	"https://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Linux%20Libraries/cd-${pkgver}_Linux54_64_lib.tar.gz"
)
sha256sums=(
	'7A1B2A748C192CD5A3C7A86FAB6A1EAF5085175A6C20BACAB5CE893E411EB623'
)

package() {
	mkdir -p "${pkgdir}/usr/include/cd"
	mkdir -p "${pkgdir}/usr/lib"
	install -m 644 "${srcdir}"/*.so "${pkgdir}/usr/lib"
	install -m 644 "${srcdir}"/include/*.h "${pkgdir}/usr/include/cd"
}
