# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=10391273ed3b7b56f98330db1efd8c1e51922bba # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=bomi-skin-papirus
pkgver=20150808
pkgrel=1
pkgdesc="Papirus theme for Bomi"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('bomi')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('934b2d28a88c155f41702512e186be4cfd9d7bf1f2370be29bd32da0ec8b6e25')

package() {
	ls ${srcdir}/${_repo}-${_git}/
    install -d ${pkgdir}/usr/share/bomi/skins
    cp -r ${srcdir}/${_repo}-${_git}/bomi-skins/Papirus ${pkgdir}/usr/share/bomi/skins/
    install -D -m644  ${srcdir}/${_repo}-${_git}/bomi-skins/Papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 