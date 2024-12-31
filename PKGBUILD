# Maintainer: Alexander Aleschenko <alex.aleschenko@gmail.com>

pkgname=emu80-base
_pkgname=emu80
pkgver=4.0.498
pkgrel=1
pkgdesc="Emulator for bunch of Soviet PCs. Assets package"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL3")
conflicts=("emu80-qt<4.0.498")
source=("https://github.com/vpyk/emu80v4/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("dc9eb0ba994be04d85ec7fb3f4bdc37569437762c3757ee3a6b3fcaad1df91b7")

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
