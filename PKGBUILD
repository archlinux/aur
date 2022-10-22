# Contributor: felix
# Contributor: Tushar R <echo dHVzaGFyXzcyN0B5YWhvby5jb20K | base64 -d>
# Contributor: Bernhard Tittelbach <xro -at- realraum -dot- at>
# Maintainer: Emil VATAI (vatai) <emil.vatai@gmail.com>

pkgname=ttf-kanjistrokeorders
pkgver=4.004
pkgrel=2
pkgdesc="Kanji stroke order font"
arch=('any')
license=('custom')
url="http://www.nihilist.org.uk/"
source=("http://www.dropbox.com/s/9jv2pnw4ohxzaml/KanjiStrokeOrders_v4.004.zip")
sha256sums=('53061d36e2c7400b2b941bd6328c40d386586d5c5a3f89c43825a2d6979d5eee')

DLAGENTS=("http::/usr/bin/curl -O -L --http1.1")

package() {
	cd "${srcdir}"

	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 "KanjiStrokeOrders_v${pkgver}.ttf" \
		"${pkgdir}/usr/share/fonts/TTF"

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 copyright.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}"

	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m644 *Sample.pdf readme*.txt \
		"${pkgdir}/usr/share/doc/${pkgname}"
}
