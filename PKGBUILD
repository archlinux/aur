# Maintainer: Philippe Cherel <philippe dot cherel at mayenne dot org>
pkgname=gog-baldurs-gate-enhanced-edition
_pkgname=baldurs-gate-enhanced-edition
_original="Baldurs Gate Enhanced Edition"
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Chaos threatens to overwhelm the Sword Coast. GOG Version. Linux native."
arch=('i686' 'x86_64')
url="http://www.gog.com/game/baldurs_gate_enhanced_edition"
license=('custom')
depends_i686=('glibc' 'alsa-lib' 'libgl')
depends_x86_64=('lib32-glibc' 'lib32-alsa-lib' 'lib32-libgl')
optdepends_i686=('libpulse: pulseaudio support')
optdepends_x86_64=('lib32-libpulse: pulseaudio support')
source=("local://gog_baldurs_gate_enhanced_edition_${pkgver}.tar.gz"
        "${pkgname}")
PKGEXT=".pkg.tar"
sha256sums=('8f28cded9f33543827daaa1703f05ffbcc5fe44f4f2f7e161c656fa5672ee411'
            'e0fd7ba999325b6c085257ffce97f2f6af4df4d99d0a587f437f8aa37a9b1889')

package() {
  mkdir -p "${pkgdir}"/opt/gog/${_pkgname}
  cp -r "${srcdir}"/"${_original}"/* "${pkgdir}"/opt/gog/${_pkgname}
  install -Dm644 "${srcdir}"/"${_original}"/support/${pkgname}-primary.desktop "${pkgdir}"/usr/share/applications/${pkgname}-primary.desktop
  install -Dm644 "${srcdir}"/"${_original}"/support/${pkgname}.png "${pkgdir}"/usr/share/pixmaps/${pkgname}.png
  install -Dm644 "${srcdir}"/"${_original}"/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}"/$pkgname "${pkgdir}"/usr/bin/${pkgname}
}
