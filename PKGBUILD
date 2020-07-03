# Mantainer: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=domination
pkgver=1.2.2
pkgrel=1
pkgdesc="A Java version of the classic Risk board game."
arch=('any')
url="http://domination.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=("https://downloads.sourceforge.net/project/domination/Domination/${pkgver}/Domination_${pkgver}.zip"
    'Domination.sh'
'domination.desktop')
sha256sums=('c3a4e5c3e6b8db567c31b281c008ed4cc348393026e4790436a6660f22a338a8'
    'f408672cdd5494732b95dad1db8db07a7c98d3fab5db7fa3925b0ebbe1b40e00'
'2f9e6435b41bbcdc212c651549729681a13ac51477e0b482a99c392cd0e63759')

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
