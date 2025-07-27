# Maintainer: Alexander Aleschenko <alex.aleschenko@gmail.com>

pkgname=emu80-base
_pkgname=emu80
pkgver=4.0.535
pkgrel=1
pkgdesc="Emulator for bunch of Soviet PCs. Assets package"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL3")
conflicts=("emu80-qt<4.0.498")
source=("https://github.com/vpyk/emu80v4/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e70dcb859327f518fca4a001c01fbc25dcadcac868ccba0ab36cca3e3e89b5bc")
package() {
	cd "emu80v4-${pkgver}"
	destination=${pkgdir}/opt/${_pkgname}

	install -d -m755 ${destination}
	cp -r dist/* ${destination}
	cp COPYING.txt ${destination}
	cp whatsnew.txt ${destination}
	cp doc/* ${destination}
	install -D -m644 "src/qt/icons/emu80.png" "${pkgdir}/usr/share/pixmaps/emu80.png"
}
