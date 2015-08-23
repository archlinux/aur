# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=a8ca2dbeb9b0bfffb64fa45f01c98c2f284313b0
_repo=papirus-pack-kde
pkgname=papirus-konsole-colorscheme
pkgver=20150823
pkgrel=1
pkgdesc="Modified and adaptive Paper colorscheme for Konsole"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=()
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('6e758251e8dabb649b3cb3dd0e2b740ef48b0254b12ffee39c6d4b9e32f3a0fe')

package() {
    install -d ${pkgdir}/usr/share/apps/konsole
    install -d ${pkgdir}/usr/share/konsole
    cp -r ${srcdir}/${_repo}-${_git}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/apps/konsole/
    cp -r ${srcdir}/${_repo}-${_git}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/konsole/
    install -D -m644  ${srcdir}/${_repo}-${_git}/konsole-colorschemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 