# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=4a2012a4ddc7f34e4d9c84364035458980bdd617
_repo=dolphin-plugin-colorfolder
pkgname=kde-servicemenus-colorfolder
pkgver=20150825
pkgrel=1
pkgdesc="Kde servicemenu colorfolder "
arch=('any')
url="https://github.com/horosgrisa/${_repo}"
license=('GPL')
options=('!strip')
depends=('dolphin')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('6ae56de2019c285c79bdb8bfdfc4ddf0ef478614caa04fcdb5f2958472405fc3')

package() {
    install -d ${pkgdir}/usr/share/kservices5/ServiceMenus
    install -d ${pkgdir}/usr/bin
    cp -r ${srcdir}/${_repo}-${_git}/colorfolder.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
    install ${srcdir}/${_repo}-${_git}/colorfolder ${pkgdir}/usr/bin
    install -D -m644  ${srcdir}/${_repo}-${_git}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 