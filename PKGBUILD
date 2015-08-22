# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=f7d48a6835fa1eb33dc882048228b6fbe8209669
_repo=papirus-pack-kde
pkgname=papirus-kmail-theme
pkgver=20150825
pkgrel=1
pkgdesc="Modified and adaptive Paper theme for Kmail"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
depends=('kmail')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('36d244e0facd648b3e141a965dd843a8e68081a5110027a5b506156e1b0d645a')

package() {
    install -d ${pkgdir}/usr/share/messageviewer/themes
    cp -r ${srcdir}/${_repo}-${_git}/kmail-theme/papirus* ${pkgdir}/usr/share/messageviewer/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/color-schemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 