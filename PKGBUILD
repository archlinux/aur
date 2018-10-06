# Maintainer: Waterloop <teamwaterloop@gmail.com>

pkgname=wio
pkgver=0.5.1
pkgrel=1
pkgdesc='An IoT Development Environment'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url='https://github.com/wio/wio'
license=('MIT')
options=("!strip")
depends=('make' 'cmake')
optdepends=('avr-gcc: compiler for AVR'
            'avr-libc: libc for AVR'
            'avrdude: for uploading to Arduino based boards'
            'gcc: for compiling natively')

_pkg_x86_64='x86_64'
_cs_x86_64='38771aa741d37539332da05c54648fcb08a08c08e8f940016ee5dc518ce76e1a'

_pkg_i686='i386'
_cs_i686='0b152c754396874149895c91165a7ed73f885863233a16e2f61bc03ed29e3e59'

_pkg_arm='arm5'
_cs_arm='f731a878459dcbc7280f6a7a2951223238915e462202667653e9c00d0e67a5b1'

_pkg_armv6h='arm6'
_cs_armv6h='637551d6ebfae657f2891c9f5ab90bc196653d8a46696b18240ce9c24c882ead'

_pkg_armv7h='arm7'
_cs_armv7h='6b944625baee57aa55310ad43c3373c260f7eaee0e2af8435ef58e6def48a526'

_pkg_str="_pkg_${CARCH}"
_cs_str="_cs_${CARCH}"

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/wio_linux_${!_pkg_str}.tar.gz")
sha256sums=("${!_cs_str}")

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin/"
	cp "wio_linux_${!_pkg_str}" "${pkgdir}/usr/bin/wio"
	mkdir -p "${pkgdir}/usr/share/wio"
	cp -R toolchain "${pkgdir}/usr/share/wio/toolchain"
}
