# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-gemini-rue
pkgver=1.0.0.2
pkgrel=1
pkgdesc="It’s a neo-noir sci-fi adventure that will take you across the galaxy."
arch=("i686" "x86_64")
url="http://www.gog.com/game/gemini_rue"
license=("custom")
groups=("games")
source=("local://gemini_rue_${pkgver}.tar.gz" "gog-gemini-rue")
sha256sums=('b0ceb9af5805d06e83e47ef646bf27f7debbc78c32a819ae44e5e9a1faf4e4ba'
            'cac6758931e92fe1c3e4caa3f6843d7619cffd33457a536e67fa7059f2ee6248')
depends=(freetype2)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/gemini-rue
  cp -r "${srcdir}"/Gemini\ Rue/* "${pkgdir}"/opt/gog/gemini-rue
  install -Dm644 "${srcdir}"/Gemini\ Rue/support/gog-gemini-rue-primary.desktop "${pkgdir}"/usr/share/applications/gog-gemini-rue.desktop
  install -Dm644 "${srcdir}"/Gemini\ Rue/support/gog-gemini-rue.png "${pkgdir}"/usr/share/pixmaps/gog-gemini-rue.png
  install -Dm644 "${srcdir}"/Gemini\ Rue/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-gemini-rue" "${pkgdir}/usr/bin/gog-gemini-rue"
}
