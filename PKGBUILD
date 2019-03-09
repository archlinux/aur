# Maintainer: Waterloop <teamwaterloop@gmail.com>

pkgname=wio
pkgver=0.9.0
pkgrel=1
pkgdesc='An IoT Development Environment'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url='https://github.com/wio/wio'
license=('MIT')
options=('!strip')
depends=('make' 'cmake')
optdepends=('avr-gcc: compiler for AVR'
            'avr-libc: libc for AVR'
            'avrdude: for uploading to Arduino based boards'
            'gcc: for compiling natively')

_pkg_x86_64='x86_64'
_cs_x86_64=''

_pkg_i686='i386'
_cs_i686=''

_pkg_arm='arm5'
_cs_arm=''

_pkg_armv6h='arm6'
_cs_armv6h=''

_pkg_armv7h='arm7'
_cs_armv7h=''

_pkg_str="_pkg_${CARCH}"
_cs_str="_cs_${CARCH}"

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/wio_linux_${!_pkg_str}.tar.gz")
sha256sums=("${!_cs_str}")

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin/"
	cp "wio_linux_${!_pkg_str}" "${pkgdir}/usr/bin/wio"
	mkdir -p "${pkgdir}/usr/share/wio"
}
