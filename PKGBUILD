# Maintainer: Waterloop <teamwaterloop@gmail.com>

pkgname=wio
pkgver=0.7.1
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
_cs_x86_64='abdb0a4676bd3213e955193ffe41db0a1a1eea258ecaa01f80d5e649d5b541df'

_pkg_i686='i386'
_cs_i686='95d59a4b35e7ab2009479ba896dc51d01174dc155d95c4943213c04382e00ff8'

_pkg_arm='arm5'
_cs_arm='e31538b029667a07b1495f3b5d45d6d0e203e198ebf24efdf1950bcfd73e03c1'

_pkg_armv6h='arm6'
_cs_armv6h='bfc97b4a89850d59ce702c0b3852b96065bb159723877fc86645227d96520c9c'

_pkg_armv7h='arm7'
_cs_armv7h='a558ea6a64b3d6add0087e73adc335ce33a7b9c6c1489da717c69895536e9884'

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
