# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=dd7a90b1ac22cff0cf63449fa4252e242f1aac33 # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=papirus-gtk-theme
pkgver=20150817
pkgrel=1
pkgdesc="Modified and adaptive Paper gtk theme"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('gtk-engine-murrine')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('b6c69ead3d912c3af4ba234251c17e21752488eeaaad000aad18f5ae22762f56')

package() {
    install -d ${pkgdir}/usr/share/themes
    cp -r ${srcdir}/${_repo}-${_git}/gtk-themes/papirus* ${pkgdir}/usr/share/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/gtk-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 