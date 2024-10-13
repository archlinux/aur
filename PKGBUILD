# Maintainer: Stefano Pigozzi <me@steffo.eu>

pkgname=ttf-ar-one-sans-variable-git
pkgver=1.001.r0.g6dc5e68
pkgrel=1
pkgdesc='Fonts for augmented and virtual reality'
url='https://github.com/niteeshy/ar-one-sans'
license=('OFL-1.1')

arch=('any')
conflicts=('ttf-ar-one-sans-variable')
provides=("ttf-ar-one-sans-variable=${pkgver}")

source=("${pkgname}::git+${url}.git")
md5sums=("SKIP")

makedepends=('git')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -dm 755 "${pkgdir}/usr/share/fonts/${pkgname}"
	install -m 644 "${pkgname}/fonts/ttf/AROneSansRetina-Bold.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/AROneSansRetina-Bold.ttf"
	install -m 644 "${pkgname}/fonts/ttf/AROneSansRetina-Medium.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/AROneSansRetina-Medium.ttf"
	install -m 644 "${pkgname}/fonts/ttf/AROneSansRetina-Regular.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/AROneSansRetina-Regular.ttf"
	install -m 644 "${pkgname}/fonts/ttf/AROneSansRetina-SemiBold.ttf" "${pkgdir}/usr/share/fonts/${pkgname}/AROneSansRetina-SemiBold.ttf"
	install -m 644 "${pkgname}/fonts/variable/AROneSans[ARRR,wght].ttf" "${pkgdir}/usr/share/fonts/${pkgname}/AROneSans[ARRR,wght].ttf"
	install -Dm644 "${pkgname}/OFL.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
