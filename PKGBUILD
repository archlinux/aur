# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=dd7a90b1ac22cff0cf63449fa4252e242f1aac33
_repo=papirus-pack-kde
pkgname=papirus-icon-theme
pkgver=20150817
pkgrel=1
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('b6c69ead3d912c3af4ba234251c17e21752488eeaaad000aad18f5ae22762f56')

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${_repo}-${_git}/icons/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 