# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=34b782f24427afcf7f6123748d325eb32ed91fb9 # lastest commit 20150731
_repo=papirus-pack-kde
pkgname=papirus
pkgver=20150812
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
sha256sums=('164a58ade9acd267e3b83f5398fbe6333e31e2007dbfa14efe1225c08e2c3a65')

package() {
   install -d ${pkgdir}/usr/share/plasma/look-and-feel
   cp -r ${srcdir}/${_repo}-${_git}/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
   install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
   find ${pkgdir}/usr -type f -exec chmod 644 {} \;
   find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 