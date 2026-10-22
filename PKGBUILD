# Maintainer: Qiusheng Wu <giswqs at gmail dot com>
pkgname=terrio-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Pure-Rust geospatial raster and vector data I/O: the terrio command (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://terrio.opengeos.org"
license=('MIT')
provides=('terrio')
conflicts=('terrio')
source_x86_64=("https://github.com/opengeos/terrio/releases/download/v${pkgver}/terrio-cli-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/opengeos/terrio/releases/download/v${pkgver}/terrio-cli-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('3d568d07a883cec8666e5715b63a560cb5a51f982337e08f463be20a4ce05198')
sha256sums_aarch64=('f161b0415e59ab054b889deb15e4304cd6b3afb11bf9bc1ce053a38443539061')

package() {
  cd "terrio-cli-v${pkgver}-${CARCH}-unknown-linux-musl"
  install -Dm755 terrio "${pkgdir}/usr/bin/terrio"
  install -Dm644 LICENSE LICENSE-THIRD-PARTY.md NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
