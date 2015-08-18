# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=ca8a010a01800dba756ffbc33e5b7e4497f64f32
_repo=papirus-pack-kde
pkgname=papirus-gtk-theme
pkgver=20150821
pkgrel=1
pkgdesc="Modified and adaptive Paper gtk theme"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('gtk-engine-murrine')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('b254dd75c57993307b9b16f2347dd5a220821acf4ad76cb3d09d0db7c9f35733')

package() {
    install -d ${pkgdir}/usr/share/themes
    cp -r ${srcdir}/${_repo}-${_git}/gtk-themes/papirus* ${pkgdir}/usr/share/themes/
    install -D -m644  ${srcdir}/${_repo}-${_git}/gtk-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 