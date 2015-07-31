# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=6e82364341aad0fd9fba91119180ff842e4c0584 # lastest commit 20150731
pkgname=papirus-icon-theme
pkgver=20150731
pkgrel=1
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${pkgname}"
license=('CCPL:by-sa')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('f9ba377946bc4b77cf1a4b633262d32542379e33cec04d4bdcb7701c428e3794')

package() {
    install -d ${pkgdir}/usr/share/icons
    rm -f ${srcdir}/${pkgname}-${_git}/*.png
    cp -r ${srcdir}/${pkgname}-${_git}/papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${pkgname}-${_git}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}