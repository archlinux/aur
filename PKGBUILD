# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=eade2fe14249abd0f134e6aa17508bb14072439a
_repo=papirus-pack-kde
pkgname=papirus
pkgver=20150821
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
sha256sums=('cefe9895346cfdcb9ce1e3000e09cb74ed96208f4ee369cbde75859377971bc8')

package() {
   install -d ${pkgdir}/usr/share/plasma/look-and-feel
   cp -r ${srcdir}/${_repo}-${_git}/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
   install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
   find ${pkgdir}/usr -type f -exec chmod 644 {} \;
   find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 