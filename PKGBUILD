# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=PKHeX
pkgname=pkhex-bin
pkgver=26.08.26
pkgrel=1
pkgdesc="Pokémon core series save editor, programmed in C#."
arch=('x86_64')
url="https://github.com/kwsch/PKHeX"
license=(GPL)
depends=(wine winetricks)
conflicts=(pkhex pkhex-git)
source=("https://downloads.iusearchbtw.nl/PKHeX-${pkgver}.tar.gz"
        "launcher"
        "icon.png"
        "pkhex.desktop")
sha256sums=('d6a2c410bfa9a0523ee42cec29e2f5aa10556f959d8df63a8f0ff680ebce61c4'
            '5c38f3f10b79c0f1fd71a9e1c980da2c2651f5549d6fa23248096b2393fed73e'
            '688456b442d51a9cdcffeb053099f23e3333e492c5b9d9266e97da7cd077b89b'
            'aa7d55c6d05a79671d38f8c4133b1fbf01d5106200d97c47658e78421e62b0d4')

package() {
  install -D -m 755 "launcher" "${pkgdir}/usr/bin/pkhex"
  install -D -m 644 "PKHeX-${pkgver}.tar.gz" "${pkgdir}/usr/share/pkhex/PKHeX.tar.gz"

  install -D -m 644 "icon.png" "${pkgdir}/usr/share/pixmaps/pkhex.png"
  install -D -m 644 "pkhex.desktop" "${pkgdir}/usr/share/applications/pkhex.desktop"

  install -D -m 644 /dev/null "${pkgdir}/usr/share/pkhex/version"
  printf '%s\n' "${pkgver}" > "${pkgdir}/usr/share/pkhex/version"
}
