# Maintainer: Nico Rittstieg <nico dot rittstieg at gmx dot de>
pkgname=ntag
pkgver=1.2.16
pkgrel=2
pkgdesc="Audio file tag editor, created with JavaFX"
arch=('x86_64')
url="https://github.com/nrittsti/ntag"
license=('GPL3')
source=("https://github.com/nrittsti/ntag/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux_bin.tar.gz")
sha256sums=('536fad7a097338af2c596d6a8a6da7146fc558bf2ccb0f5b4cf685f81e6c7e3f')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-linux_bin"
	install -dm755 "${pkgdir}/opt/ntag/libs"
	install -Dm644 libs/*.jar "${pkgdir}/opt/ntag/libs"
	install -Dm644 *.{jar,png,txt,pdf,properties} "${pkgdir}/opt/ntag"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -dm755 "${pkgdir}/opt/ntag/jre"
	cp -r --no-preserve=ownership --preserve=mode jre/* "$pkgdir"/opt/ntag/jre/
}
