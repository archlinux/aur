# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=9ead85d18bdd5a278d0786196f83847933003667
_repo=papirus-pack-kde
pkgname=papirus-kmail-theme
pkgver=20150824
pkgrel=1
pkgdesc="Modified and adaptive Paper theme for Kmail"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
depends=('kmail')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('bf53b0c593d0792fff0da120e7389915d5516fe59378bf08c084b99dcea72d27')

package() {
    install -d ${pkgdir}/usr/share/messageviewer/themes
    cp -r ${srcdir}/${_repo}-${_git}/kmail-theme/papirus* ${pkgdir}/usr/share/messageviewer/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/color-schemes/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 