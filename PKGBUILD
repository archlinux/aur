# Maintainer: Waterloop <teamwaterloop@gmail.com>

pkgname=wio
pkgver=0.9.0
pkgrel=1
pkgdesc='An IoT Development Environment'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/wio/wio'
license=('MIT')
options=('!strip')
depends=('make' 'cmake')
optdepends=('avr-gcc: compiler for AVR'
            'avr-libc: libc for AVR'
            'avrdude: for uploading to Arduino based boards'
            'gcc: for compiling natively')

_pkg_x86_64='64bit'
_cs_x86_64='f52fe2c53868cd7d481abefd136728887165c84826f429bd275830817764aba2'

_pkg_i686='32bit'
_cs_i686='1e49a2efd1edf3bfd34534ccde7d0d6d50fcf72fa624925e7694f2216c172898'

_pkg_arm='arm'
_cs_arm='71183e21e09a089db87cd1839f414d252b0cb1b0ab889a1fc6b4708e7cb475cd'

_pkg_armv6h='arm'
_cs_armv6h='71183e21e09a089db87cd1839f414d252b0cb1b0ab889a1fc6b4708e7cb475cd'

_pkg_armv7h='arm'
_cs_armv7h='71183e21e09a089db87cd1839f414d252b0cb1b0ab889a1fc6b4708e7cb475cd'

_pkg_aarch64='arm64'
_cs_aarch64='b3aadb75a7289fbf1ac6b2fc12fb62565c64e1298944b1f9446717bd91907a53'

_pkg_str="_pkg_${CARCH}"
_cs_str="_cs_${CARCH}"

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/wio_${pkgver}_linux_${!_pkg_str}.tar.gz")
sha256sums=("${!_cs_str}")

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/bin/"
	cp wio "${pkgdir}/usr/bin/wio"
	mkdir -p "${pkgdir}/usr/share/wio"
}
