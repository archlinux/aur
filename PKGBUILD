# Maintainer: Qiusheng Wu <giswqs at gmail dot com>
pkgname=terrio-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Pure-Rust geospatial raster and vector data I/O: the terrio command (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://terrio.dev"
license=('MIT' 'MPL-2.0')
provides=('terrio')
conflicts=('terrio')
source_x86_64=("https://github.com/opengeos/terrio/releases/download/v${pkgver}/terrio-cli-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/opengeos/terrio/releases/download/v${pkgver}/terrio-cli-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('a85d920b71e7f566c3bebb8a7ec3b469174cfe69ebce6a6f0ba3c055ca5a0fc8')
sha256sums_aarch64=('46551aff2bfad27294c5347fb42f412a8bed8d5fc08106d3e400ba9fd8463900')

package() {
  cd "terrio-cli-v${pkgver}-${CARCH}-unknown-linux-musl"
  install -Dm755 terrio "${pkgdir}/usr/bin/terrio"
  install -Dm644 LICENSE LICENSE-THIRD-PARTY.md NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
