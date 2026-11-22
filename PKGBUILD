# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tuistash-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="A TUI for monitoring Logstash"
arch=('x86_64' 'aarch64')
url="https://github.com/edmocosta/tuistash"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/edmocosta/tuistash/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tuistash-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tuistash-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('f3999288dff8df0cfb9246af3f286946c74e27debfa9aefb92bc5e7b9776b99e')
sha256sums_aarch64=('f21416f05bd60247575f32af496b1f9e63ebf3e9a48154c3d5ec27e06f4284e7')

package() {
  install -Dm755 "tuistash" "${pkgdir}/usr/bin/tuistash"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
