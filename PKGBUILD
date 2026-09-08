pkgname=emu80-base
_pkgname=emu80
pkgver=4.0.571
pkgrel=1
pkgdesc="Emulator for bunch of Soviet PCs. Assets package"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL-3.0-or-later")
conflicts=("emu80-qt<4.0.498")
source=("https://github.com/vpyk/emu80v4/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d0b632094af8af71bd84dafad8f76c97ee3752f3574dcefc3b9448c4e56bd91')
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
