# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fast-note-sync-service-bin
pkgver=3.6.1
pkgrel=1
pkgdesc="Low-latency note synchronization service with a web UI and REST API"
arch=('x86_64' 'aarch64')
url="https://github.com/haierkeys/fast-note-sync-service"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/haierkeys/fast-note-sync-service/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fast-note-sync-service-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fast-note-sync-service-${pkgver}-linux-arm64.tar.gz")
sha256sums=('0c0f3c7cad5aa48c127fdb50c089f7742788c90dd1a7170ea734d41d9993d3fe')
sha256sums_x86_64=('b6fdd037f33066ab7644814112ed82bc8528f8a1b10d0faf4f53d9d28834e237')
sha256sums_aarch64=('948d640912d58b5038f1bf348db6264cd452756ed0ba0088c51322aebcfe01dd')

package() {
  install -Dm755 "./fast-note-sync-service" "${pkgdir}/usr/bin/fast-note-sync-service"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
