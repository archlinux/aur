# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=d5b1405f29ee2acae2d6021749b666735d9e4434
_repo=papirus-pack-kde
pkgname=papirus-plasma-theme
pkgver=20150901
pkgrel=1
pkgdesc="Modified and adaptive Paper plasma theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('1b5bb6ce3b9a101928a0db12e1befc861a2634442208e2180f2aaca9466a84ea')

package() {
    install -d ${pkgdir}/usr/share/plasma/desktoptheme
    cp -r ${srcdir}/${_repo}-${_git}/plasma-themes/papirus* ${pkgdir}/usr/share/plasma/desktoptheme/
    install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 