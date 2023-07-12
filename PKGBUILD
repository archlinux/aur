# Mantainer: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=domination
pkgver=1.2.8
pkgrel=1
pkgdesc="A Java version of the classic Risk board game."
arch=('any')
url="http://domination.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=("https://downloads.sourceforge.net/project/domination/Domination/${pkgver}/Domination_${pkgver}.zip"
    'Domination.sh'
'domination.desktop')
sha256sums=('1658fc98e1498e9e721600a919b72ab488179068ba4d7c062bc01daf3dcfea28'
            'f408672cdd5494732b95dad1db8db07a7c98d3fab5db7fa3925b0ebbe1b40e00'
            'd15c38aa2fa0ad464205c1498918bd4e774bc05a5d6df4f58f47c4dd37293268')

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
