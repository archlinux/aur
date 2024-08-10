# Maintainer: Manos Vlassis <aur@mvlassis.com>
pkgname=ttf-munro
pkgver=1.0
pkgrel=1
pkgdesc="A sans-serif pixel font by Ted by Twenty"
arch=('any')
url="http://www.tenbytwenty.com/#munro"
license=('OFL-1.1')
source=("https://www.wfonts.com/download/data/2016/05/03/munro/munro.zip"
	   "https://www.wfonts.com/download/data/2016/05/04/munro-narrow/munro-narrow.zip"
	   "https://www.wfonts.com/download/data/2015/03/10/munro-small/munro-small.zip"
	   "https://raw.githubusercontent.com/mvlassis/ttf-munro/main/OFL.txt")
sha256sums=("ea8124a3144c62eecf7ce5cfc30c80bb00047e4e4a63b85a705ec69161e4b2b8"
			"64478c333e1b5eb9b2d772958e6815db6ab16122f23bd0049c0b8e549d342f23"
			"e30ba8373cf4c5d6d14df353f63800e4bfd13707542c846240e77971de2479b9"
			"abafdb1faeb8bf1f5704f8ac476c731f28360b90686991d7dac71676ee3b657f")

package() {
	install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
	
	bsdtar -xf "munro.zip"
	install -m 644 "munro.ttf" "${pkgdir}/usr/share/fonts/TTF/"

	bsdtar -xf "munro-narrow.zip"
	install -m 644 "munro_narrow.ttf" "${pkgdir}/usr/share/fonts/TTF/"

	bsdtar -xf "munro-small.zip" -C "${srcdir}"
	install -m 644 "munro_small.ttf" "${pkgdir}/usr/share/fonts/TTF/"

	install -Dm 644 "OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
