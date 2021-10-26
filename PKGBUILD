# Maintainer: Vinicius Almada <viniciusalmada10@gmail.com>

pkgname=iup-bin
pkgver=3.30
pkgrel=1
epoch=0
pkgdesc="A multi-platform toolkit for building graphical user interfaces. Pre-compiled."
arch=('x86_64')
url="https://www.tecgraf.puc-rio.br/iup/"
license=('MIT')
conflicts=('iup' 'libcd')
options=(!strip)
source=(
	"https://downloads.sourceforge.net/project/iup/${pkgver}/Linux%20Libraries/iup-${pkgver}_Linux54_64_lib.tar.gz"
)
sha256sums=(
	'7f97b70f8bbf1a59f6b3dd002a381eebacd51855b28dac69f95c9a3d90cbd65a'
)

package() {
	mkdir -p "${pkgdir}/usr/include/iup"
	mkdir -p "${pkgdir}/usr/lib"
	install -m 644 "${srcdir}"/*.so "${pkgdir}/usr/lib"
	install -m 644 "${srcdir}"/include/*.h "${pkgdir}/usr/include/iup"
}
