# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=gravitation
pkgver=1.4.5
pkgrel=2
pkgdesc="Gravitation is a retro gravity cave flyer for 1-4 players, featuring single player time trials or multiplayer racing and dogfighting."
arch=("i686" "x86_64")
url="http://www.demonstudios.com/gravitation.html"
license=("custom")
groups=("games")
source=("http://www.demonstudios.com/Gravitation_Linux.zip" "gravitation.desktop" "gravitation")
sha512sums=('26da259e0779f46bac371f0cfe599d14e48529c8077bffbf70fc3d9e8fa869eb2e66e37f955ddc9c813a30b48163e618d18f8838ba34c552b8847d0324a1fc8d'
			'2a6049b1d9868e219c96dfbd9de42c1649293b29cb0677e29a147109831fd1b05e568c4cdccced81e51c7e752a366824bde75840b07c36a39717fe328b4cf512'
			'ef11a3208ea5aec2689fd9b49de8f96f35113bc7599403d26ef4fca58bacaabe73809c9affef9930fb30fafd2a54e1ccbd5d64c72deb32dc637d480f5b0d116b')
depends=(lib32-libgl lib32-libx11)

package() {
  mkdir -p "${pkgdir}"/opt/gravitation
  cp -r "${srcdir}"/Gravitation_Data "${srcdir}"/Gravitation.x86 "${srcdir}"/ReadMe.rtf  "${pkgdir}"/opt/gravitation
  install -Dm644 "${srcdir}"/gravitation.desktop "${pkgdir}"/usr/share/applications/gravitation.desktop
  install -Dm644 "${srcdir}"/Gravitation_Data/Resources/UnityPlayer.png "${pkgdir}"/usr/share/pixmaps/gravitation.png
  install -Dm755 "${srcdir}"/gravitation "${pkgdir}"/usr/bin/gravitation
}
