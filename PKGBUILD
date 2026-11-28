# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nowen-video-bin
pkgver=1.3.7
pkgrel=1
pkgdesc="Self-hosted media server with TMDb metadata and HLS streaming"
arch=('x86_64' 'aarch64')
url="https://github.com/cropflre/nowen-video"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nowen-video-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nowen-video-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('4f4fdd78d8922a35add69e07c8c3333688dcc66a2264c9cdc154925c2923f0d7')
sha256sums_aarch64=('82235d24078c48dd37b881a17f1a11b1fe02c29b0761515fb3bc0975160cab8b')

package() {
  install -Dm755 "./nowen-video" "${pkgdir}/usr/bin/nowen-video"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
