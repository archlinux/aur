# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=gravitation
pkgver=1.4.3
pkgrel=1
pkgdesc="Gravitation is a retro gravity cave flyer for 1-4 players, featuring single player time trials or multiplayer racing and dogfighting."
arch=("i686" "x86_64")
url="http://www.demonstudios.com/gravitation.html"
license=("custom")
groups=("games")
source=("http://www.demonstudios.com/Gravitation_Linux.zip" "gravitation.desktop" "gravitation")
md5sums=('4578a3e316561bec8f016d7e0285aec7'
         '84f0cfadf91e2785d1e6386c6ccbc73f'
         'e78709ba830c99bfceb6828f313b2df0')
depends=(libgl libx11)

package() {
  mkdir -p "${pkgdir}"/opt/gravitation
  cp -r "${srcdir}"/Gravitation_Data "${srcdir}"/Gravitation.x86* "${srcdir}"/Readme.rtf  "${pkgdir}"/opt/gravitation
  install -Dm644 "${srcdir}"/gravitation.desktop "${pkgdir}"/usr/share/applications/gravitation.desktop
  install -Dm644 "${srcdir}"/Gravitation_Data/Resources/UnityPlayer.png "${pkgdir}"/usr/share/pixmaps/gravitation.png
  install -Dm755 "${srcdir}"/gravitation "${pkgdir}"/usr/bin/gravitation
}
