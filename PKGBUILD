# Maintainer: FadeMind <fademind@gmail.com>

_git=d8f4735b35ab30ef33ff1a9526486079ee2ea7f3
_basename=FaenzaFlattr2-Zephyr
pkgname=faenzaflattr-zephyr-icon-theme
pkgver=20150531
pkgrel=2
pkgdesc="A mix of Faenza and Flattr icon theme. Zephyr variant. For KDE4 and Plasma 5."
arch=('any')
url="https://github.com/FadeMind/${_basename}"
license=('CCPL:by-nc-sa')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('02e3f703e4aecefbe60bf6b7a2d48465286d3ab3f78a05d1a24793de11180f9b')

package() {
    install -d ${pkgdir}/usr/share/icons
    install -Dm644 ${srcdir}/${_basename}-${_git}/COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
    cp -r ${srcdir}/${_basename}-${_git} ${pkgdir}/usr/share/icons/${_basename}
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
