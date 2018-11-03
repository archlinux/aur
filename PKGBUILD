# Maintainer: Waterloop <teamwaterloop@gmail.com>

pkgname=wio
pkgver=0.6.2
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
_cs_x86_64='605d16e954cd3f5fb3abf37dbfa407934db5b11ffa74e61161a721db6a5bf311'

_pkg_i686='i386'
_cs_i686='650978801af7ea18378300be9beb5ef4b365b1c2598567f4d58189efd8bf208e'

_pkg_arm='arm5'
_cs_arm='f192fd1d0f487803514bb5cc243f21c4f386d1ac449c22c195e017a435072702'

_pkg_armv6h='arm6'
_cs_armv6h='11bb619171f87f85b1733fa1050b35ddb58fb537c2c4a262f4c78d0d347a9bdc'

_pkg_armv7h='arm7'
_cs_armv7h='6dd43369cac40d47ded0935498aab11121d6d1ab5d9b0e335a5df2ef15d5e7bf'

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
