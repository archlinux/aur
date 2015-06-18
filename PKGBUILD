# Maintainer: Dusan Saiko <dusan.saiko@gmail.com>

pkgname=onemoresamegame
pkgver=1.2.1
pkgrel=1

pkgdesc="One more version of a puzzle game where you select the same group of pieces."
url="https://github.com/dsaiko/onemoresamegame"

changelog=CHANGELOG

arch=('i686' 'x86_64')

license=('Apache')

depends=("qt5-base>=5.2.1" "qt5-declarative>" "qt5-graphicaleffects>" "qt5-quickcontrols>" "qt5-script>")

source=(
	'https://github.com/dsaiko/onemoresamegame/archive/1.2.1.tar.gz'
)

sha256sums=('15ee0faf1248f907e2adc05407161d9bf1edd5a6a81cb714387c8540fcaab3a4')

build() {
	 cd "${srcdir}"
	 cd "${pkgname}-${pkgver}"
	 
	 qmake CONFIG+=release
	 make
}

package() {
	cd "${srcdir}"
	cd "${pkgname}-${pkgver}"

	
	install -d -m 755 "${pkgdir}/usr/bin"
	install -d -m 755 "${pkgdir}/usr/share/pixmaps"
	install -d -m 755 "${pkgdir}/usr/share/applications"
	install -d -m 755 "${pkgdir}/usr/share/man/man6"
	
	install -m 644 "./onemoresamegame.desktop" "${pkgdir}/usr/share/applications/"
	install -m 644 "./icon.png" "${pkgdir}/usr/share/pixmaps/onemoresamegame.png"
	install -m 755 ./onemoresamegame "${pkgdir}/usr/bin/"
	install -m 644 "dist/onemoresamegame.6.gz" "${pkgdir}/usr/share/man/man6/" 
}

