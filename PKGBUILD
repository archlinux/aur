# Maintainer: Ákos Uzonyi <uzonyi.akos@gmail.com>
pkgname=circuit-simulator
pkgver=1.6
pkgrel=1
pkgdesc="Electronic circuit simulator written by Paul Falstad"
arch=("any")
url="http://www.falstad.com/circuit-java"
license=("GPL")
depends=("java-runtime>=6" "hicolor-icon-theme" "bash")
makedepends=("unzip" "imagemagick")
source=("http://www.falstad.com/circuit-java/circuit.zip" "circuit" "circuit.desktop")
md5sums=("392f5956d1153755949b167842ccd7cc"
         "bd735bd306f677ee117e07784bec74e1"
	 "46ff1375643354a241c6c67fba7f08e5"
)

package() {
	cd "$srcdir"
	
	mkdir -pm 755 "${pkgdir}/opt/circuit"
	unzip circuit.zip -d "${pkgdir}/opt/circuit"
	chmod -R 644 "${pkgdir}/opt/circuit"
	chmod -R +X "${pkgdir}/opt/circuit"
	
	install -D -m755 "${srcdir}/circuit" "${pkgdir}/usr/bin/circuit"
	install -D -m644 "${srcdir}/circuit.desktop" "${pkgdir}/usr/share/applications/circuit.desktop"
	
	mkdir -pm 755 "${pkgdir}/usr/share/icons/hicolor/16x16/apps"
	convert "${pkgdir}/opt/circuit/favicon.ico" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/circuit.png"
}
