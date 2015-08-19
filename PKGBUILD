# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=36517331dca364463080f7d38b736a0c27ef99b2
_repo=papirus-pack-kde
pkgname=papirus-icon-theme
pkgver=20150822
pkgrel=1
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('f9b70d46e320a587653945ec5ea5891225973c440d879c2dc483dcf1d8ba3c63')

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${_repo}-${_git}/icons/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 