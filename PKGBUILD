# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=dd7a90b1ac22cff0cf63449fa4252e242f1aac33 # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=papirus-yakuake-theme
pkgver=20150817
pkgrel=1
pkgdesc="Modified and adaptive Paper theme for Yakuake"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('yakuake')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('b6c69ead3d912c3af4ba234251c17e21752488eeaaad000aad18f5ae22762f56')

package() {
    install -d ${pkgdir}/usr/share/apps/yakuake/skins
    install -d ${pkgdir}/usr/share/yakuake/skins
    cp -r ${srcdir}/${_repo}-${_git}/yakuake-skins/papirus* ${pkgdir}/usr/share/apps/yakuake/skins/
    cp -r ${srcdir}/${_repo}-${_git}/yakuake-skins/papirus* ${pkgdir}/usr/share/yakuake/skins/
    install -D -m644  ${srcdir}/${_repo}-${_git}/yakuake-skins/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 