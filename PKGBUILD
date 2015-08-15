# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=10391273ed3b7b56f98330db1efd8c1e51922bba # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=papirus-icon-theme
pkgver=20150809
pkgrel=1
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('934b2d28a88c155f41702512e186be4cfd9d7bf1f2370be29bd32da0ec8b6e25')

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${_repo}-${_git}/icons/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 