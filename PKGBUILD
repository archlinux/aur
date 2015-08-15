# Maintainer: FadeMind <fademind@gmail.com>

_git=b2c0e30303723fbb98ec04c91eb6a5b9e5c44908
_pkgname=FaenzaFlattr2-Zephyr
pkgname=faenzaflattr-zephyr-icon-theme
pkgver=20150815
pkgrel=1
pkgdesc="A mix of Faenza and Flattr icon theme. Zephyr variant. For KDE4 and Plasma 5."
arch=('any')
url="https://github.com/FadeMind/${_pkgname}"
license=('CCPL:by-nc-sa')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('5e056d9e436dbbb802f67d32e279285126f0d7ef66f2ec3d146ee7d2567e182d')

package() {
    install -d ${pkgdir}/usr/share/icons
    install -Dm644 ${srcdir}/${_pkgname}-${_git}/COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
    cp -r ${srcdir}/${_pkgname}-${_git} ${pkgdir}/usr/share/icons/${_pkgname}
    rm -f ${pkgdir}/usr/share/icons/${_pkgname}/*.png
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
