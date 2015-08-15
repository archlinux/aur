# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=10391273ed3b7b56f98330db1efd8c1e51922bba # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=papirus-yakuake-theme
pkgver=20150808
pkgrel=1
pkgdesc="Modified and adaptive Paper theme for Yakuake"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
depends=('yakuake')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('934b2d28a88c155f41702512e186be4cfd9d7bf1f2370be29bd32da0ec8b6e25')

package() {
    install -d ${pkgdir}/usr/share/apps/yakuake/skins
    install -d ${pkgdir}/usr/share/yakuake/skins
    cp -r ${srcdir}/${_repo}-${_git}/yakuake-skins/papirus* ${pkgdir}/usr/share/apps/yakuake/skins/
    cp -r ${srcdir}/${_repo}-${_git}/yakuake-skins/papirus* ${pkgdir}/usr/share/yakuake/skins/
    install -D -m644  ${srcdir}/${_repo}-${_git}/yakuake-skins/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 