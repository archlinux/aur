# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=2ebf0e5956d20c06435245307d5617e4afec5e82
_repo=papirus-pack-kde
pkgname=papirus-konsole-colorscheme
pkgver=20150825
pkgrel=1
pkgdesc="Modified and adaptive Paper colorscheme for Konsole"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('konsole')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('4ea1ef367cfd0ddd91fd16a043808ae36bb7000f0174b8ab9337b2b0a61f7795')

package() {
    install -d ${pkgdir}/usr/share/apps/konsole
    install -d ${pkgdir}/usr/share/konsole
    cp -r ${srcdir}/${_repo}-${_git}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/apps/konsole/
    cp -r ${srcdir}/${_repo}-${_git}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/konsole/
    install -D -m644  ${srcdir}/${_repo}-${_git}/konsole-colorschemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 