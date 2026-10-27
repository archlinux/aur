# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=PKHeX
pkgname=pkhex-bin
pkgver=26.10.18
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
sha256sums=('355635f05a66baa3707e8f7637a286797dcbd2989eb77f5b4a97a2f02e1978c8'
            '719553125841d37c233adfe2265a3f3802a218093cd42a79e1f2fe2937bf468d'
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
