#Maintainer: Sam Peters <dev at libertycloud dot de>
# Contributor: Dan McCurry <dan.mc at protonmail dot com>
pkgname=profex
<<<<<<< Updated upstream
pkgver=5.2.8
pkgrel=1
year=2024
month=03
=======
pkgver=5.2.9
pkgrel=1
year=2024
month=05
>>>>>>> Stashed changes
pkgdesc="A program for Rietveld refinement of powder X-ray diffraction data."
arch=('i686' 'x86_64')
url="https://profex.doebelin.org"
license=('GPL2')
groups=('science')
depends=('qt6-5compat'
	'qt6-declarative'
	'qt6-svg')
optdepends=('bgmn: the needed backend for the program, not required to build or start the program')
provides=('profex')
conflicts=('profex')
source=("https://www.profex-xrd.org/wp-content/uploads/${year}/${month}/${pkgname}-${pkgver}.tar.gz"
	'profex.desktop')
<<<<<<< Updated upstream
sha256sums=('9e7b0fb4db882d786f802405c13fdfcf14690eb01bfd746f64c5c33745e23924'
=======
sha256sums=('954ce7b92ff05e1b2601348d9b11060935f0e7c2fa87419862351dfabfb5c1e5'
>>>>>>> Stashed changes
            '8d4e73987458eb9d1453c3bfe839a90ea1f5c15a0872ea5a35d0b532231d9194')
makeprepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	qmake6 PREFIX=${pkgdir}/usr -r profex.pro
	make -j 8
}

package() {
	cd ${srcdir}
	install -Dm644 "${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	cd "$pkgname-$pkgver"
	install -Dm644 "profex/icons/${pkgname}5.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
	make install
	
  mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 ${srcdir}/${pkgname}-${pkgver}/bin/* "${pkgdir}/usr/bin/"

}
