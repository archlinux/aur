# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=dd7a90b1ac22cff0cf63449fa4252e242f1aac33 # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=libreoffice-papirus-theme
pkgver=20150817
pkgrel=1
pkgdesc="Libreoffice Papirus theme "
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('libreoffice')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('b6c69ead3d912c3af4ba234251c17e21752488eeaaad000aad18f5ae22762f56')

package() {
    install -d ${pkgdir}/usr/lib/libreoffice/share/config
    cp -r ${srcdir}/${_repo}-${_git}/libreoffice-icons/images_papirus.zip ${pkgdir}/usr/lib/libreoffice/share/config
    install -D -m644  ${srcdir}/${_repo}-${_git}/libreoffice-icons/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 