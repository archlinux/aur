# Maintainer: Nico Rittstieg <nico.rittstieg@gmx.de>
pkgname=ntag
pkgver=1.1.0
pkgrel=1
pkgdesc="Audio file tag editor, created with JavaFX"
arch=('x86_64')
url="https://github.com/nrittsti/ntag"
license=('GPL3')
depends=('jre-openjdk')
source=("https://github.com/nrittsti/ntag/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux_bin.tar.gz")
md5sums=('974be60a99473965070c5520fba4b9a4')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/opt/ntag/libs"
	install -Dm644 libs/*.jar "${pkgdir}/opt/ntag/libs"
	install -Dm644 *.{jar,png,txt,pdf,properties} "${pkgdir}/opt/ntag"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

