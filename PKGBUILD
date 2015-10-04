# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=4a2012a4ddc7f34e4d9c84364035458980bdd617
_repo=papirus-pack-kde
pkgname=papirus-aurorae-theme
pkgver=20150916
pkgrel=2
pkgdesc="Modified and adaptive Paper decorations for Kwin"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=()
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('6ae56de2019c285c79bdb8bfdfc4ddf0ef478614caa04fcdb5f2958472405fc3')

package() {
    install -d ${pkgdir}/usr/share/aurorae/themes
    cp -r ${srcdir}/${_repo}-${_git}/aurorae-themes/Papirus* ${pkgdir}/usr/share/aurorae/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/aurorae-themes/Papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 