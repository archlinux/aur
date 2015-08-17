# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=bd6b167e33e8a36cc15e550830161aa7037d5899 # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=papirus
pkgver=20150818
pkgrel=1
pkgdesc="Look-and-feel package for modified and adaptive Paper theme for KDE."
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
depends=('papirus-plasma-theme' 'papirus-icon-theme' 'papirus-color-scheme' 'papirus-gtk-theme')
optdepends=('papirus-yakuake-theme: Modified and adaptive Paper theme for Yakuake'
			'bomi-skin-papirus: Papirus theme for Bomi'
			'libreoffice-papirus-theme: Papirus theme for Libreoffice')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('f652eb750fa51d270af24aa792327c32995866eaec1d65cda2115d92e81f935a')

package() {
   install -d ${pkgdir}/usr/share/plasma/look-and-feel
   cp -r ${srcdir}/${_repo}-${_git}/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
   install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
   find ${pkgdir}/usr -type f -exec chmod 644 {} \;
   find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 