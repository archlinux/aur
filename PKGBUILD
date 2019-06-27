# Maintainer: FoolEcho <foolecho@gmail.com>
pkgname=gog-icewind-dale-enhanced-edition
_pkgname=icewind-dale-enhanced-edition
pkgver=2.1.0.5
pkgrel=1
pkgdesc="Icewind Dale: Enhanced Edition is a classic RPG running through the Spine of the World of the Forgotten Realms. GOG Version. Linux native."
arch=('x86_64')
url="http://www.gog.com/game/icewind_dale_enhanced_edition"
license=('custom')
depends=('lib32-glibc' 'lib32-alsa-lib' 'lib32-libgl' 'lib32-libjson' 'lib32-openssl-1.0')
optdepends=('lib32-libpulse: pulseaudio support')
changelog=ChangeLog
source=("local://gog_icewind_dale_enhanced_edition_${pkgver}.sh"
	"${pkgname}"
	"${pkgname}.desktop")
md5sums=('fc7244f4793eec365b8ac41d91a4edbb'
         '0ccf31e1428606487b2ea9079e69da03'
	 'e9f0eff0f1eb6d151ae935ceef1337f1')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/${_pkgname}
  cp -r "${srcdir}"/data/noarch/* "${pkgdir}"/opt/gog/${_pkgname}
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -Dm644 "${srcdir}"/data/noarch/support/icon.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
  install -Dm644 "${srcdir}"/data/noarch/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}"/$pkgname "${pkgdir}"/usr/bin/${pkgname}
}
