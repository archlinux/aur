# Maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>
pkgname=substance-player
pkgver=2017.1.0
pkgrel=2
pkgdesc="PBR material preview, visualization and tweaking software."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-player'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=('https://download.allegorithmic.com/substance-player/2017.x/Substance_Player-2017.1.0-305-linux-x64-standard-full.rpm'
        'substance-player-icon.png'
        'substance-player.desktop'
        'substance-player')
noextract=()
sha256sums=('90ed4e491e3fa18f14e112b3a7bfb2d46ecd59833bc2de824b2dcd085946bb75'
            '87d2e879c24a26e63334614b9f1c5d24bfb2eb2b606762b63ce5a2fe6a54345e'
            '4c95e98abcf740f92cf65ba64ce142a8bda42798d632a06e2e4c3cb871a37626'
            'f024998986230fe480ea77c62c655e0e468e0b3664dbc0120d865311db19944e')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/opt/Allegorithmic
  mv ${srcdir}/opt/Allegorithmic/Substance_Player ${pkgdir}/opt/Allegorithmic

  install -Dm644 ${pkgdir}/opt/Allegorithmic/Substance_Player/eula.txt \
                 ${pkgdir}/usr/share/licenses/${pkgname}/eula.txt
  rm ${pkgdir}/opt/Allegorithmic/Substance_Player/eula.txt

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/substance-player.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/substance-player-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/substance-player"
}
