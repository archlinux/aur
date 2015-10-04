# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=3f97691234d1688ad54b94d9b81f9ef181b0d8e9
_repo=papirus-pack-kde
pkgname=papirus-gtk-theme
pkgver=20151004
pkgrel=1
pkgdesc="Modified and adaptive Paper gtk theme"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('gtk-engine-murrine')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('87e2b1cbb0e08588a231d5c2638926de7ba566c5c0df81f4a897f95b54957f63')

package() {
    install -d ${pkgdir}/usr/share/themes
    cp -r ${srcdir}/${_repo}-${_git}/gtk-themes/papirus* ${pkgdir}/usr/share/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/gtk-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 