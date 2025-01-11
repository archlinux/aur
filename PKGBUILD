# Maintainer: zzzardoz <zzzardoz at mail dot de>
# Contributor: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=domination
pkgver=1.3.3
pkgrel=1
pkgdesc="A Java version of the classic Risk board game."
arch=('any')
url="http://domination.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=("https://downloads.sourceforge.net/project/domination/Domination/${pkgver}/Domination_${pkgver}.zip"
    'Domination.sh'
'domination.desktop')
sha256sums=('1fb911aa102f7138a60243ef2c3b099197d1f5770b425f7d5868a544d95c8b23'
            'f408672cdd5494732b95dad1db8db07a7c98d3fab5db7fa3925b0ebbe1b40e00'
            '84f2dc4904922f86af5a19395027cf0ce968a4be3404c819d8895746b6c61ad8')

package() {
    install -d "${pkgdir}/usr/share"
    cp -r "${srcdir}/Domination" "${pkgdir}/usr/share/"
    find ${pkgdir} -type d -exec chmod 755 {} \;
    find ${pkgdir} -type f -exec chmod 644 {} \;
    find ${pkgdir} -type f -name "*.sh" -exec chmod 755 {} \;
    install -D -m755 "${srcdir}/Domination.sh" "${pkgdir}/usr/bin/domination"
    install -D -m755 "${srcdir}/domination.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m755 "${srcdir}/Domination/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

