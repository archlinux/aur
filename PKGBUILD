pkgname=substance-player
_pkgname=substance-player
pkgver=2017.1.0
_pkgver=2017
pkgrel=1
pkgdesc="Node-based, non-destructive PBR material player"
arch=('x86_64')
url='https://www.allegorithmic.com/'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=( "https://alg-releases.s3.amazonaws.com/public_releases/${_pkgname}/2017.x/Substance_Player-${pkgver}-305-linux-x64-standard-full.rpm"
 "substance-player-icon-${_pkgver}.png"
 "substance-player-${_pkgver}.desktop")
noextract=()
sha256sums=('90ed4e491e3fa18f14e112b3a7bfb2d46ecd59833bc2de824b2dcd085946bb75'
            '87d2e879c24a26e63334614b9f1c5d24bfb2eb2b606762b63ce5a2fe6a54345e'
            '23dcde3924b5dca3aa114ff6570d29c68e150e023fd095e889d0bd3aecbd0a7e')
validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/opt/Allegorithmic"
  mv "${srcdir}/opt/Allegorithmic/Substance_Player" "${pkgdir}/opt/Allegorithmic"
  mv "${pkgdir}/opt/Allegorithmic/Substance_Player" "${pkgdir}/opt/Allegorithmic/Substance_Player_${_pkgver}"

  install -Dm644 "${pkgdir}/opt/Allegorithmic/Substance_Player_${_pkgver}/eula.txt" \
                 "${pkgdir}/usr/share/licenses/${_pkgname}/eula.txt"
  rm "${pkgdir}/opt/Allegorithmic/Substance_Player_${_pkgver}/eula.txt"

  install -Dm644 -t "${pkgdir}/usr/share/applications" \
                    "${srcdir}/substance-player-${_pkgver}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" \
                    "${srcdir}/substance-player-icon-${_pkgver}.png"
}

