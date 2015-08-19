# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=b8302a1181d78295600a193ace76a08269e88474
_repo=papirus-pack-kde
pkgname=papirus-icon-theme
pkgver=20150828
pkgrel=1
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('93eb1ff64804e0a9891be855fd061444d19f74c42d5410971098dc2f6eeb83a7')

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${_repo}-${_git}/icons/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 