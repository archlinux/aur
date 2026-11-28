# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=akena-watch-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Uptime monitor in a single static binary without Docker"
arch=('x86_64' 'aarch64')
url="https://github.com/xic17/akena-watch"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/xic17/akena-watch/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/akena-watch-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/akena-watch-linux-arm64")
sha256sums=('940b6b2941857176e66d2bb8baac0fc9aa8a1f6c1c3c11232d1bc9f6ef6a183b')
sha256sums_x86_64=('88066141d2ad57d7fe4a2b705fb68ca17a4856e0e6189876690922b09c86bcb5')
sha256sums_aarch64=('6f763eba74c02417f7247cec29bc927805a0402e2326f27fb4ff88da72b0f78d')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/akena-watch"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
