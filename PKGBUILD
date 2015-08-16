# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=7add4846d4e9f2319d4e8d9b54ecb2615d260af8 # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=papirus-plasma-theme
pkgver=20150811
pkgrel=1
pkgdesc="Modified and adaptive Paper plasma theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('cca0a6290e7a9c998f84cc0b30b5d3f330e91c64f756f6371c626858d8acfbdf')

package() {
    install -d ${pkgdir}/usr/share/plasma/desktoptheme
    cp -r ${srcdir}/${_repo}-${_git}/plasma-themes/papirus* ${pkgdir}/usr/share/plasma/desktoptheme/
    install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 