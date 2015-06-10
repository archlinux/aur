pkgname="stm8flash-git"
pkgver="20150517"
pkgrel="1"
pkgdesc="Utility for flashing STM8 MCU family via ST-LINK (V1 and V2)"
arch=('i686' 'x86_64')
url='https://github.com/vdudouyt/stm8flash'
license=('GPL2')
depends=('libusb')
makedepends=('git')
source=()
md5sums=()

build() {
	cd "${srcdir}"
	git clone https://github.com/vdudouyt/stm8flash
	cd "stm8flash"
	make
}

package() {
	cd "${srcdir}/stm8flash"
	mkdir -p "${pkgdir}/usr/bin"
	make DESTDIR="${pkgdir}" install
}