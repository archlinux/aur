# Maintainer: FadeMind <fademind@gmail.com>

_git=ee54d470cdb0743569057264e90657f137212d93
_basename=FaenzaFlattr2-Zephyr
pkgname=faenzaflattr-zephyr-icon-theme
pkgver=20150710
pkgrel=1
pkgdesc="A mix of Faenza and Flattr icon theme. Zephyr variant. For KDE4 and Plasma 5."
arch=('any')
url="https://github.com/FadeMind/${_basename}"
license=('CCPL:by-nc-sa')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('2d69d50fe2c9028aa93e34bcdd3b99f8447de599320b651e766249038d3087d2')

package() {
    install -d ${pkgdir}/usr/share/icons
    install -Dm644 ${srcdir}/${_basename}-${_git}/COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
    cp -r ${srcdir}/${_basename}-${_git} ${pkgdir}/usr/share/icons/${_basename}
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
