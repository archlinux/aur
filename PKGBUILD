# Maintainer: Vinicius Almada <viniciusalmada10@gmail.com>

pkgname=im-bin
pkgver=3.15
pkgrel=1
epoch=0
pkgdesc="A toolkit for image representation, storage, capture and processing. Pre-compiled."
arch=('x86_64')
url="https://www.tecgraf.puc-rio.br/im/"
license=('MIT')
conflicts=('iup' 'libcd')
options=(!strip)
source=(
	"https://downloads.sourceforge.net/project/imtoolkit/${pkgver}/Linux%20Libraries/im-${pkgver}_Linux54_64_lib.tar.gz"
)
sha256sums=(
	'CEE034DB27D2D42CE66CAB8B74903D389657316931F7DA390E6DE5477AE2C008'
)

package() {
	mkdir -p "${pkgdir}/usr/include/im"
	mkdir -p "${pkgdir}/usr/lib"
	install -m 644 "${srcdir}"/*.so "${pkgdir}/usr/lib"
	install -m 644 "${srcdir}"/include/*.h "${pkgdir}/usr/include/im"
}
