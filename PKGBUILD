# Maintainer: Nico Rittstieg <nico dot rittstieg at gmx dot de>
pkgname=ntag
pkgver=1.2.13
pkgrel=1
pkgdesc="Audio file tag editor, created with JavaFX"
arch=('x86_64')
url="https://github.com/nrittsti/ntag"
license=('GPL3')
source=("https://github.com/nrittsti/ntag/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux_bin.tar.gz")
sha256sums=('8c7408e2ffaa98c05e49595c763662b288e7342576b99dca1a53bc8e81dd8c60')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/opt/ntag/lib"
	install -Dm644 lib/*.jar "${pkgdir}/opt/ntag/lib"
	install -Dm644 *.{jar,png,txt,pdf,properties} "${pkgdir}/opt/ntag"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -dm755 "${pkgdir}/opt/ntag/jre"
	cp -r --no-preserve=ownership --preserve=mode jre/* "$pkgdir"/opt/ntag/jre/
}
