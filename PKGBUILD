# Maintainer: matrix <thysupremematrix attttttt tuta dotttt io>
# Please download a TTF/TTC of this font into your working directory under the name FangZhengKaiTi.ttc (if you downloaded a TTF, simply change the file extension to .TTC). You can download the font from a number of different sources, but we recommend you use the official website.

pkgname=ttf-fangzhengkaiti-pinyin
pkgver=1 # No package version, not even in TTF/TTC
pkgrel=1
pkgdesc="A set of Chinese fons that provides pinyin above the characters"
arch=("any")
url="https://www.foundertype.com/index.php/FontInfo/index/id/137"
license=("custom:Personal non-commercial licence")
source=("FangZhengKaiTi.ttc::file://FangZhengKaiTi.ttc")
sha256sums=('SKIP') # sha256sums differ between versions
makedepends=('wkhtmltopdf')

DLAGENTS+=("file::/usr/bin/echo Unable to locate %u, please download the file to \"$(pwd)\" and move it to FangZhengKaiTi.ttc. If you downloaded a ttf file, please change the file extension to .ttc")

package() {
	wkhtmltopdf "https://foundertype.com/index.php/About/powerPer.html" "${srcdir}/LICENSE.pdf"
	install -Dm755 "${srcdir}/FangZhengKaiTi.ttc" "${pkgdir}/usr/share/fonts/TTF/FangZhengKaiTi.ttc"
	install -Dm644 "${srcdir}/LICENSE.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}

