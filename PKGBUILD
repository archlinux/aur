# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=fc03e5f960e8b0d942e4c339b11b931e89c52356
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
sha256sums=('89a4c33445c01a87947167e86b23bfa83b0814b91f49b35478891893e3b9d50f')

package() {
    install -d ${pkgdir}/usr/share/kservices5/ServiceMenus
    install -d ${pkgdir}/usr/bin
    cp -r ${srcdir}/${_repo}-${_git}/colorfolder.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
    install ${srcdir}/${_repo}-${_git}/colorfolder ${pkgdir}/usr/bin
    install -D -m644  ${srcdir}/${_repo}-${_git}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 