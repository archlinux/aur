# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=3b6e54abe80232c2e9ae6dc6d50b1da951e455b9
_repo=papirus-pack-kde
pkgname=papirus-icon-theme
pkgver=20150827
pkgrel=1
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('f86688b38a8e665b5bda316cba1dbe4f7f8aacfe9ddcc5bd012f7930028b8ce6')

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_repo}-${_git}/icons/papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${_repo}-${_git}/icons/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 