# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2-data
pkgver=2.1.10
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('GPL')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game'
            'srb2-bin: "Sonic Robo Blast 2" game, precompiled')
source=("http://rosenthalcastle.org/srb2/SRB2-v217-Installer.exe"
        "http://rosenthalcastle.org/srb2/SRB2-v2110-patch.zip"
        "https://raw.githubusercontent.com/STJr/SRB2/SRB2_release_$pkgver/src/sdl/SDL_icon.xpm"
        "srb2.desktop"
        "srb2-opengl.desktop")
sha256sums=('2d4d2be6c43d26c02ec1a462af223397b7002ec58618eed541ae746e2878c83b'
            'e07e5c26dbf384253cf527d78ffc4c48ec44601c9434f9b7a59355a90b2bb4e6'
            '25b73393baa18ac60782c3b4172c1d4345649322e420bbfe284e542445987d3f'
            'ac9fa63f29ad9413797da8c6f0a4f76fa6f4dd0710d1e84a457a8c42cf6df4f9'
            'f696bab390d2b1028bf2f5c5d4d838c0981dc211cec4c4a8f349b7ec0580e701')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 {music,patch,player,rings,zones}.dta srb2.srb \
    "$pkgdir"/usr/share/games/SRB2
  # icon + .desktop
  install -Dm644 SDL_icon.xpm "$pkgdir"/usr/share/pixmaps/srb2.xpm
  install -Dm644 srb2.desktop "$pkgdir"/usr/share/applications/srb2.desktop
  install -m644 srb2-opengl.desktop "$pkgdir"/usr/share/applications
}
