# Maintainer: Waterloop <teamwaterloop@gmail.com>

pkgname=wio
pkgver=0.8.0
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
_cs_x86_64='61ded025be01d6737074d9631872f0cde6c6b0271c025b58085e4c8331d43839'

_pkg_i686='i386'
_cs_i686='00cbabe4db98b76b1546dde6090dd0b1bebb12dc6f6b84d2820c20360e676f88'

_pkg_arm='arm5'
_cs_arm='48c70deb69765cb0095f15dfc890fce96d5fb3975ec5a03f70a6510c87eec5ec'

_pkg_armv6h='arm6'
_cs_armv6h='61765ec39d582f28eea0af7938c69e36b48ea45518c224997f4f676dceee80d9'

_pkg_armv7h='arm7'
_cs_armv7h='9f8cb934ef91b98a052e92e7f14457491ddf963ccf6c76be30a1c5e0982979b6'

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
