# Maintainer: basigur

pkgname=puzzle-jigsaw
pkgver=1.0.2
pkgrel=1
pkgdesc="Tiling puzzle that requires the assembly mosaiced pieces"
arch=('x86_64')
url="https://bitbucket.org/admsasha/puzzle-jigsaw"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'qt5-multimedia')
source=("https://bitbucket.org/admsasha/puzzle-jigsaw/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('855ad4ddc382de2e114c4aeed523d49dd6437d23f61a9aec1f7e9239ff62c28724a087ba203f3f5f1c6267c18af688742317997c768f2715cfe1520f4372c138')


build() {
	cd "${pkgname}-${pkgver}"
	qmake-qt5
	make
}


package(){
	cd "${pkgname}-${pkgver}"
	make INSTALL_ROOT="${pkgdir}" install
	install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 'CONTRIBUTORS' "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTORS"
	install -Dm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
