#
# PKGBUILD: tpasm
#
# Maintainer: uffe Jakobsen <_microtop_-at-_starion_-_dot_-_dk>
#
# Past Maintainer: Steven Honeyman <stevenhoneyman -at_ gmail -dot_ com>
#

pkgname=tpasm
pkgver=1.12
pkgrel=1
pkgdesc="A cross assembler for 6805, 6809, 68HC11, 6502, Sunplus, 8051, Z80, PIC, AVR and c166"
arch=('i686' 'x86_64')
url="http://www.sqrt.com/"
license=('GPL')
depends=(gcc-libs)
options=('strip' '!emptydirs')
source=(http://www.sqrt.com/downloads/tpasm.tgz)
sha256sums=('f5b4db9329f6bb160572fc1eeb0e4352796767200426a679849014ea5eb2392c')

#
#
#
build()
{
	cd "${srcdir}/${pkgname}${pkgver}"
	make
}

#
#
#
package()
{
	cd "${srcdir}/${pkgname}${pkgver}"
	install -Dm 755 tpasm "${pkgdir}/usr/bin/tpasm"

	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/samples"
	install -m 644 *.TXT "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"
	install -m 644 samples/* "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/samples"
}

#
# EOF
#
