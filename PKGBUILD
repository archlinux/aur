# Maintainer: t-ask <t-ask-aur at cixera.com>
# Co-maintainer: lehthanis <lehthanis@gmail.com>
# Co-maintainer: Rain_Shinotsu <Rain_Shinotsu@protonmail.com>
# Contributor: Oscar Morante <spacepluk@gmail.com>
# Contributor: Dragoon Aethis <dragoon@dragonic.eu>

pkgname=substance-player
pkgver=11.3.3
_build=5429
pkgrel=1
pkgdesc="PBR material preview, visualization and tweaking software."
arch=('x86_64')
url='hhttps://www.substance3d.com/'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=("https://download.substance3d.com/substance-player/11.x/Substance_Player-${pkgver}-${_build}-linux-x64-standard.rpm")

sha256sums=('72583d4a07f90a0f23a272691e4e0775060cbb796a2fde0b22fbb24b1e208ff0')

validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/Adobe"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/opt/Allegorithmic/Substance_Player/resources/adobe-Substance_Player.desktop"
  install -Dm644 "${srcdir}/opt/Allegorithmic/Substance_Player/resources/adobe-x.adobe.substance3d.designer.xml" "${pkgdir}/usr/share/mime/packages/adobe-x.adobe.substance.player.xml"
  install -Dm644 -t "${pkgdir}/usr/share/icons" "${srcdir}/opt/Allegorithmic/Substance_Player/resources/icons/player-256x256.png"

  mv "${pkgdir}/usr/share/icons/player-256x256.png" "${pkgdir}/usr/share/icons/allegorithmic-Substance_Player.png"
  mv "${srcdir}/opt/Allegorithmic" "${pkgdir}/opt/"
}
