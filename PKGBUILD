# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=3f97691234d1688ad54b94d9b81f9ef181b0d8e9
_repo=papirus-pack-kde
pkgname=papirus-konsole-colorscheme
pkgver=20151004
pkgrel=1
pkgdesc="Modified and adaptive Paper colorscheme for Konsole"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('konsole')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('87e2b1cbb0e08588a231d5c2638926de7ba566c5c0df81f4a897f95b54957f63')

package() {
    install -d ${pkgdir}/usr/share/apps/konsole
    install -d ${pkgdir}/usr/share/konsole
    cp -r ${srcdir}/${_repo}-${_git}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/apps/konsole/
    cp -r ${srcdir}/${_repo}-${_git}/konsole-colorschemes/Papirus*.colorscheme ${pkgdir}/usr/share/konsole/
    install -D -m644  ${srcdir}/${_repo}-${_git}/konsole-colorschemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 