# Maintainer: MCbabel <https://github.com/MCbabel>
pkgname=steam-manifest-downloader-terminal-bin
_pkgname=steam-manifest-downloader-terminal
pkgver=1.5.0
pkgrel=1
pkgdesc="Terminal UI and headless CLI (smd) of Steam Manifest Downloader (precompiled)"
arch=('x86_64')
url="https://github.com/MCbabel/Steam-Manifest-Downloader"
license=('GPL-2.0-or-later')
optdepends=('openssl: for the optional DepotDownloaderMod engine')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=(!strip)
source=(
  "smd-${pkgver}::${url}/releases/download/v${pkgver}/Steam-Manifest-Downloader-Terminal_${pkgver}_linux-x64"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  'e8819e62b65a9c83d6f71d6369006c3f5ccbaa61d479b5636d97314c0f3021c2'
  'f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505'
)

package() {
  install -Dm755 "${srcdir}/smd-${pkgver}" "${pkgdir}/usr/bin/smd"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
