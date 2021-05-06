# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=nona
pkgver=2.0
pkgrel=1
pkgdesc="NONA: Analyzing large data sets in reasonable times: solutions for composite optima"
arch=('any')
url="https://github.com/starsareintherose/nona/"
license=('custom')
depends=(
	'wine'
	'wine_gecko'
	'wine-mono'
)
source=("https://github.com/starsareintherose/nona/releases/download/v2.0/NONA.zip" "nona.desktop" "nona")
sha256sums=('508f41744162a6e637b6844048e51e5e49c8d689ec4373d2442113d08abe4d52'
            '47d543686903d8226427472e4f0ebe1edfa6bec3a551787bf60013300a29aea3'
            '21a66189b3bf4f9eb475b7d7adbef903d867de0cc4a69008340fbba67cdc8405')

package() {
	mkdir "${pkgdir}/usr/"
	mkdir "${pkgdir}/usr/bin"
	mkdir "${pkgdir}/usr/share/"
	mkdir "${pkgdir}/usr/share/nona/"
	install -D -m 755 ${srcdir}/*.htm "${pkgdir}/usr/share/nona/"
	install -Dm755 ${srcdir}/nona.exe ${pkgdir}/usr/share/nona/nona.exe
	install -Dm755 ${srcdir}/nona.desktop ${pkgdir}/usr/share/applications/nona.desktop
	install -Dm755 ${srcdir}/nona ${pkgdir}/usr/bin/nona
}
