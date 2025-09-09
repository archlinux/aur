# Maintainer: Daniel Fichtinger <daniel AT ficd DOT sh>

_pkgname="ashuffle"
pkgname="${_pkgname}-bin"
pkgver=3.14.9
pkgrel=1
pkgdesc="Automatic library-wide shuffle for mpd."
url="https://github.com/joshkunz/ashuffle"
arch=(x86_64 aarch64)
license=(MIT)
provides=('ashuffle')
conflicts=('ashuffle' 'ashuffle-git')

depends=("libmpdclient" "yaml-cpp" "abseil-cpp>=20211102.0")

source=(
  "https://github.com/joshkunz/ashuffle/releases/download/v${pkgver}/ashuffle.${CARCH}-linux-gnu"
)

sha256sums=('22b176d87ab694ae4fde997812fd47fcbb12b283b93c4d249f69588a0e2c6554')

package() {
    install -Dm 755 "${srcdir}/ashuffle.${CARCH}-linux-gnu" "${pkgdir}/usr/bin/ashuffle"
}
