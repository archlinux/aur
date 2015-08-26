# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=2ebf0e5956d20c06435245307d5617e4afec5e82
_repo=papirus-pack-kde
pkgname=papirus
pkgver=20150825
pkgrel=1
pkgdesc="Look-and-feel package for modified and adaptive Paper theme for KDE."
arch=('any')
url="https://github.com/varlesh/${_repo}"
license=('CCPL:by-sa')
depends=('papirus-plasma-theme' 'papirus-icon-theme' 'papirus-color-scheme' 'papirus-gtk-theme')
optdepends=('papirus-yakuake-theme: Modified and adaptive Paper theme for Yakuake'
			'papirus-konsole-colorscheme: Modified and adaptive Paper colorscheme for Konsole'
			'papirus-kmail-theme: Modified and adaptive Paper theme for Kmail'
			'bomi-skin-papirus: Papirus theme for Bomi'
			'libreoffice-papirus-theme: Papirus theme for Libreoffice')
options=('!strip')
source=("${_repo}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('4ea1ef367cfd0ddd91fd16a043808ae36bb7000f0174b8ab9337b2b0a61f7795')

package() {
   install -d ${pkgdir}/usr/share/plasma/look-and-feel
   cp -r ${srcdir}/${_repo}-${_git}/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
   install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
   find ${pkgdir}/usr -type f -exec chmod 644 {} \;
   find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 