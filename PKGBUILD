# Maintainer: Pio <xpio at tut dot by>

pkgname=exploding_numbers
pkgver=0.991
pkgrel=1
pkgdesc="A puzzle game with dividing and adding numbers in 2D grid"
arch=('any')
url="http://advokat011.com/games/exploding_numbers"
license=('GPL')
depends=('love')
makedepends=('unzip')
source=(${pkgname}.sh
        ${pkgname}.desktop
    	${url}/${pkgname}-${pkgver}.love)
noextract=(${pkgname}-${pkgver}.love)
sha256sums=('ed08ce09182aa95031b5b69a4fd02d25d32a9853b837a116723d7b40b9b435ab'
            '619fde49df1c773cab3f4f57686b8fe4a0f31aa2a2d0cd9819c846e28847eee2'
            'a48d095cb84778347dc74e05b73f3b371488fe006f886a6c83eee8118aa326b6')

prepare() {
	cd ${srcdir}
	unzip ${pkgname}-${pkgver}.love icon.png
}

package() {
	# Data
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}.love" "${pkgdir}/usr/share/${pkgname}/${pkgname}.love"
	# Launcher
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	# Desktop
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
