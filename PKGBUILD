# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=34fd7cf2ec8ad0e4dddb3dc04366cd44ef0f2dcc # lastest commit 20150731
pkgname=papirus-icon-theme
pkgver=20150802	
pkgrel=1
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${pkgname}"
license=('CCPL:by-sa')
options=('!strip' '!libtool' '!staticlibs' '!zipman')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('5ae8c7932a50f16afebec01c105f764d2b111455e651bddb07406e9156cfde8f')

package() {
    install -d ${pkgdir}/usr/share/icons
    rm -f ${srcdir}/${pkgname}-${_git}/*.png
    cp -r ${srcdir}/${pkgname}-${_git}/papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${pkgname}-${_git}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}