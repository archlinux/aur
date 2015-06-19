# Maintainer: FoolEcho <foolecho@gmail.com>
pkgname=gog-icewind-dale-enhanced-edition
_pkgname=icewind-dale-enhanced-edition
_original="Icewind Dale Enhanced Edition"
pkgver=1.1.0.2
pkgrel=2
pkgdesc="Icewind Dale: Enhanced Edition is a classic RPG running through the Spine of the World of the Forgotten Realms. GOG Version. Linux native."
arch=('i686' 'x86_64')
url="http://www.gog.com/game/icewind_dale_enhanced_edition"
license=('custom')
if [[ $CARCH == i686 ]]; then
  depends=('glibc' 'alsa-lib' 'libgl')
  optdepends=('libpulse: pulseaudio support')
else
  depends=('lib32-glibc' 'lib32-alsa-lib' 'lib32-libgl')
  optdepends=('lib32-libpulse: pulseaudio support')
fi
changelog=ChangeLog
source=("local://gog_icewind_dale_enhanced_edition_${pkgver}.tar.gz"
	"${pkgname}")
md5sums=('f46925947ffda89b02d660078a296a3d'
         '0ccf31e1428606487b2ea9079e69da03')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/${_pkgname}
  cp -r "${srcdir}"/"${_original}"/* "${pkgdir}"/opt/gog/${_pkgname}
  install -Dm644 "${srcdir}"/"${_original}"/support/${pkgname}-primary.desktop "${pkgdir}"/usr/share/applications/${pkgname}-primary.desktop
  install -Dm644 "${srcdir}"/"${_original}"/support/${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
  install -Dm644 "${srcdir}"/"${_original}"/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}"/$pkgname "${pkgdir}"/usr/bin/${pkgname}
}
