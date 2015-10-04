# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=3f97691234d1688ad54b94d9b81f9ef181b0d8e9
_repo=papirus-pack-kde
pkgname=papirus
pkgver=20151004
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
sha256sums=('87e2b1cbb0e08588a231d5c2638926de7ba566c5c0df81f4a897f95b54957f63')

package() {
   install -d ${pkgdir}/usr/share/plasma/look-and-feel
   cp -r ${srcdir}/${_repo}-${_git}/look-and-feel/* ${pkgdir}/usr/share/plasma/look-and-feel/
   install -D -m644  ${srcdir}/${_repo}-${_git}/plasma-themes/papirus/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
   find ${pkgdir}/usr -type f -exec chmod 644 {} \;
   find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 