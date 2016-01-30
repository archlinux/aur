# Maintainer:  Kurt McAlpine <kurt@linux.com>

pkgname='syslinux-editor'
pkgver='0.1'
pkgrel='1'
pkgdesc='Tool to clean up the /boot directory for the syslinux bootloader'
arch=('i686' 'x86_64')
url='https://github.com/kurtmc/syslinux-editor'
license=('GPL2')
depends=('ncurses')
makedepends=('gcc')
source=("https://github.com/kurtmc/syslinux-editor/archive/v${pkgver}.tar.gz")
sha256sums=('baf7cc0b191a4e569ba9ff8cfe12cf83ffe28a3d82f9211d98d5239dc4231f31')

prepare() {
	cd "${srcdir}/syslinux-editor-${pkgver}"
}

build() {
	cd "${srcdir}/syslinux-editor-${pkgver}"
	make
}

package() {
	cd "${srcdir}/syslinux-editor-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
