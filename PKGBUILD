# Maintainer: damir <sudo pacman at gmail com>
# Contributor: duckmercury
# Contributor: Gordon Chan <gc@gondro.xyz>

pkgname=ttf-shanggu
pkgver=1.028
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
md5sums=('62829d5af9a855a44d1ec495735d92cc'
         '5048c2513f9393664d964ca4614fc5d4'
         '427d297d1205a5cd102b0a4d6077ce70'
         'c142696d49a5169ee3ff4f2d4be18830'
         'e8888de3a28b75eea861166464b99b42')
package() {
    install -Dm644 *.ttc -t "${pkgdir}/usr/share/fonts/shanggu/"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/70-shanggu.conf" -t "${pkgdir}/usr/share/fontconfig/conf.avail/"
}
