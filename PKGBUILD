# Maintainer: Qiusheng Wu <giswqs at gmail dot com>
pkgname=terrio-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Pure-Rust geospatial raster and vector data I/O: the terrio command (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://terrio.opengeos.org"
license=('MIT')
provides=('terrio')
conflicts=('terrio')
source_x86_64=("https://github.com/opengeos/terrio/releases/download/v${pkgver}/terrio-cli-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/opengeos/terrio/releases/download/v${pkgver}/terrio-cli-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('e91a6609b1ea2fbe6358d8b1b5054e98cc1b3e56364fe46167da685064a90293')
sha256sums_aarch64=('25bac2b6e2306ded756a4f42eb4ae7cd5f3a8ca1db7e7a8b12433b3a4adab754')

package() {
  cd "terrio-cli-v${pkgver}-${CARCH}-unknown-linux-musl"
  install -Dm755 terrio "${pkgdir}/usr/bin/terrio"
  install -Dm644 LICENSE LICENSE-THIRD-PARTY.md NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
