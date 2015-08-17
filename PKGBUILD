# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=eade2fe14249abd0f134e6aa17508bb14072439a
_repo=papirus-pack-kde
pkgname=papirus-gtk-theme
pkgver=20150820
pkgrel=1
pkgdesc="Modified and adaptive Paper gtk theme"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('gtk-engine-murrine')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('cefe9895346cfdcb9ce1e3000e09cb74ed96208f4ee369cbde75859377971bc8')

package() {
    install -d ${pkgdir}/usr/share/themes
    cp -r ${srcdir}/${_repo}-${_git}/gtk-themes/papirus* ${pkgdir}/usr/share/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/gtk-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 