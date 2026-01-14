# Maintainer: damir <sudo pacman at gmail com>
# Contributor: duckmercury
# Contributor: Gordon Chan <gc@gondro.xyz>

pkgname=ttf-shanggu
pkgver=1.027
pkgrel=1
pkgdesc="Calligraphic CJK font based on Source-Han-Sans in static TTF format"
arch=('any')
url="https://github.com/GuiWonder/Shanggu"
license=('OFL-1.1')
provides=('ttf-font')
source=("${url}/releases/download/${pkgver}/ShangguMonoOTCs.7z"
        "${url}/releases/download/${pkgver}/ShangguSansOTCs.7z"
        "${url}/releases/download/${pkgver}/ShangguSerifOTCs.7z"
        "${url}/releases/download/${pkgver}/ShangguRoundTTCs.7z"
        "70-shanggu.conf")
md5sums=('b42a0db15bbd338cfec5b8075ead01fd'
			'a02cf6e76f1d452d6ef351b73ea92d38'
			'6c68d435c8592a4af277d1b682a3d056'
			'34647bb63d2ebd0fabeac224e614d293'
			'e8888de3a28b75eea861166464b99b42')
package() {
    install -Dm644 *.ttc -t "${pkgdir}/usr/share/fonts/shanggu/"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/70-shanggu.conf" -t "${pkgdir}/usr/share/fontconfig/conf.avail/"
}
