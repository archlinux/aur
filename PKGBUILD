# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=a7bdaa976859b8f8d6f9c983e2e6b3685699e7db # lastest commit 20150731
pkgname=papirus-icon-theme
pkgver=20150808
pkgrel=1
pkgdesc="Modified and adaptive Paper icon theme for KDE"
arch=('any')
url="https://github.com/varlesh/${pkgname}"
license=('CCPL:by-sa')
options=('!strip' '!docs' '!libtool' '!staticlibs' '!zipman' '!purge' '!upx')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('ea46ee4b8822a181ab63ae762272c8dd055b8da174681c3e941855652d656aa6')

package() {
    install -d ${pkgdir}/usr/share/icons
    rm -f ${srcdir}/${pkgname}-${_git}/*.png
    cp -r ${srcdir}/${pkgname}-${_git}/papirus* ${pkgdir}/usr/share/icons/
    install -D -m644  ${srcdir}/${pkgname}-${_git}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}