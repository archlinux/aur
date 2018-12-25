# Maintainer: Oscar Morante <spacepluk@gmail.com>
# Co-maintainer: Dragoon Aethis <dragoon@dragonic.eu>
pkgname=substance-player
pkgver=2018.3.1
_build=1869
pkgrel=1
pkgdesc="PBR material preview, visualization and tweaking software."
arch=('x86_64')
url='https://www.allegorithmic.com/products/substance-player'
license=('custom')
depends=('fontconfig' 'gcc-libs-multilib' 'glu' 'hicolor-icon-theme' 'libtiff4')
options=('!strip')
source=("https://download.allegorithmic.com/substance-player/2018.x/Substance_Player-${pkgver}-${_build}-linux-x64-standard-full.rpm"
        'substance-player-icon.png'
        'substance-player.desktop'
        'substance-player')
sha256sums=('7b6ef4a0ab7a1d933bda61403eec3c2d9098b35d68c1beece01f6d42d673cc23'
            '87d2e879c24a26e63334614b9f1c5d24bfb2eb2b606762b63ce5a2fe6a54345e'
            '8bc1808ed6a841ca94968bbd2c55507ad10a79e1fbd2c3bc929bb8f056ddd331'
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
