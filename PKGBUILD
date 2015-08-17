# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=bd6b167e33e8a36cc15e550830161aa7037d5899 # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=papirus-plasma-theme
pkgver=20150818
pkgrel=1
pkgdesc="Modified and adaptive Paper plasma theme for KDE"
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('f652eb750fa51d270af24aa792327c32995866eaec1d65cda2115d92e81f935a')

package() {
    install -d ${pkgdir}/usr/share/plasma/desktoptheme
    cp -r ${srcdir}/${_repo}-${_git}/plasma-themes/papirus* ${pkgdir}/usr/share/plasma/desktoptheme/
    install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 