# Maintainer: Qiusheng Wu <giswqs at gmail dot com>
pkgname=terrio-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Pure-Rust geospatial raster and vector data I/O: the terrio command (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://terrio.opengeos.org"
license=('MIT' 'MPL-2.0')
provides=('terrio')
conflicts=('terrio')
source_x86_64=("https://github.com/opengeos/terrio/releases/download/v${pkgver}/terrio-cli-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/opengeos/terrio/releases/download/v${pkgver}/terrio-cli-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('016cdc2f64dbe45915aea7565f6e9fa332f806fbf92778200c9ad0bd7e3ab37a')
sha256sums_aarch64=('c6bffadf44856070b8727fd594786e669fa21f7af2f1694c8875ff47d3f247b5')

package() {
  cd "terrio-cli-v${pkgver}-${CARCH}-unknown-linux-musl"
  install -Dm755 terrio "${pkgdir}/usr/bin/terrio"
  install -Dm644 LICENSE LICENSE-THIRD-PARTY.md NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
