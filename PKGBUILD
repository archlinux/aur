# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=dd7a90b1ac22cff0cf63449fa4252e242f1aac33 # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=bomi-skin-papirus
pkgver=20150817
pkgrel=1
pkgdesc="Papirus theme for Bomi"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('bomi')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('b6c69ead3d912c3af4ba234251c17e21752488eeaaad000aad18f5ae22762f56')

package() {
    install -d ${pkgdir}/usr/share/bomi/skins
    cp -r ${srcdir}/${_repo}-${_git}/bomi-skin/Papirus ${pkgdir}/usr/share/bomi/skins/
    install -D -m644  ${srcdir}/${_repo}-${_git}/bomi-skin/Papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 