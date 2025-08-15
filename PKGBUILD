# Maintainer: damir <sudo pacman at gmail com>
# Contributor: duckmercury
# Contributor: Gordon Chan <gc@gondro.xyz>

pkgname=ttf-shanggu
pkgver=1.022
pkgrel=2
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
md5sums=('37f18903015c118dcd7bf41a4a8584ea'
         'f5ba508a66ccd4656b4509917768ef7e'
         'c33470bae4ec7c57e5562c06ccce0686'
         '03e65b79ec3e7ebb4be9d25745eb3795'
         'e8888de3a28b75eea861166464b99b42')

package() {
    install -Dm644 *.ttc -t "${pkgdir}/usr/share/fonts/shanggu/"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/70-shanggu.conf" -t "${pkgdir}/usr/share/fontconfig/conf.avail/"
}
