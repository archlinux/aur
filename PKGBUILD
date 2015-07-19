# Maintainer: KIV <kiv.apple@gmail.com>

pkgname=libopencm3-ldscripts-git
pkgver=1
pkgrel=1
pkgdesc="ldscripts generator for ARM MCUs from libopencm3 library"
url="https://github.com/libopencm3/libopencm3"
arch=('any')
license=('LGPL3')
depends=('python2' 'python2-pyserial')
optdepends=('libopencm3-git')
makedepends=('git' 'awk')
conflicts=()
replaces=()
backup=()

source=()
md5sums=()

build() {
	cd "${srcdir}"
	git clone https://github.com/libopencm3/libopencm3
}

package() {
	cd "${srcdir}/libopencm3/ld"
	install devices.data "${pkgdir}/usr/arm-none-eabi/lib/"
	install linker.ld.S "${pkgdir}/usr/arm-none-eabi/lib/"
	install Makefile.linker "${pkgdir}/usr/arm-none-eabi/lib/"
}
