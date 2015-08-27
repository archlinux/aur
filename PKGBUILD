# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=47fefa762bb747b9bcfa5571e0fff3b30e494c17
_repo=papirus-pack-kde
pkgname=papirus-icon-theme
pkgver=20150837 # ;)
pkgrel=1
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('c3435ecf9fcee1a89ff54a8a09a7b43fc8554cd679d16cb792cc4506f8aa64ff')

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${_repo}-${_git}/icons/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 