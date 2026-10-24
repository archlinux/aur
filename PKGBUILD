# Maintainer: Qiusheng Wu <giswqs at gmail dot com>
pkgname=terrio-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Pure-Rust geospatial raster and vector data I/O: the terrio command (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://terrio.opengeos.org"
license=('MIT')
provides=('terrio')
conflicts=('terrio')
source_x86_64=("https://github.com/opengeos/terrio/releases/download/v${pkgver}/terrio-cli-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/opengeos/terrio/releases/download/v${pkgver}/terrio-cli-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('3dbc6e8e539571f42142448012a0bf7578353c2206023cab8c879237a6e31f1d')
sha256sums_aarch64=('481f66ee3291a29708592ef65ea71372c9a3ae62fd2a758ee0a19392d8f7c722')

package() {
  cd "terrio-cli-v${pkgver}-${CARCH}-unknown-linux-musl"
  install -Dm755 terrio "${pkgdir}/usr/bin/terrio"
  install -Dm644 LICENSE LICENSE-THIRD-PARTY.md NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
