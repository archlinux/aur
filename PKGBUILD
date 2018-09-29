# Maintainer: Waterloop <teamwaterloop@gmail.com>

pkgname=wio
pkgver=0.4.1
pkgrel=1
pkgdesc='An IoT Development Environment'
arch=('x86_64')
url='https://github.com/wio/wio'
license=('MIT')
options=("!strip")
depends=('make' 'cmake')
optdepends=('avr-gcc: compiler for AVR'
            'avr-libc: libc for AVR'
            'avrdude: for uploading to Arduino based boards'
            'gcc: for compiling natively')

_pkg_x86_64='x86_64'
_cs_x86_64='10233790cf6af5fcd410a026085ce01a7ee5fd6e474ecbd14a12c8a0004b61d6'
_pkg_i686='i386'
_cs_i686='cc2498de41809228e9f847b66cefd6afb4920f41a9dbc79a4f4e12867aa6fd2e'
_pkg_armv6h='arm6'
_cs_armv6h='496d2b5646289d77ecd974527ce9569612230fd2795ced889fd896aa663d15c8'
_pkg_aarch64='arm64'
_cs_aarch64='8994cc97b649b601a74ef3de89bee213a86981dc3a582d09e6c43009e66faaee'

_pkg_str="_pkg_${CARCH}"
_cs_str="_cs_${CARCH}"

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/wio_linux_${!_pkg_str}.tar.gz")
sha256sums=("${!_cs_str}")

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin/"
	cp wio "${pkgdir}/usr/bin/wio"
	mkdir -p "${pkgdir}/usr/share/wio"
	cp -R toolchain "${pkgdir}/usr/share/wio/toolchain"
}
