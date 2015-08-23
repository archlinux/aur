# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=16257cbdd9c0ba113a51ead5614360621382c384
_repo=papirus-pack-kde
pkgname=papirus-konsole-colorscheme
pkgver=20150822
pkgrel=1
pkgdesc="Modified and adaptive Paper colorscheme for Konsole"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=()
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('SKIP')

package() {
    install -d ${pkgdir}/usr/share/apps/konsole
    install -d ${pkgdir}/usr/share/konsole
    cp -r ${srcdir}/${_repo}-${_git}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/apps/konsole/
    cp -r ${srcdir}/${_repo}-${_git}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/konsole/
    #install -D -m644  ${srcdir}/${_repo}-${_git}/konsole-colorschemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 