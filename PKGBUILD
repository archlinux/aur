# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=daptin-bin
pkgver=0.13.63
pkgrel=1
pkgdesc="Self-hosted application server for schema-driven APIs, identity, files, automation, integrations, realtime, metering, and protocols"
arch=('x86_64' 'aarch64')
url="https://github.com/daptin/daptin"
license=('LGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/daptin-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/daptin-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('c6da8868c04ca7976b80bd5fd0ab1467f43eccecd5d7b5de9f998b05be74a4da')
sha256sums_aarch64=('a9491ff8e385ae5ac23f5ddf05242909bb66370dbe103d9fddacf0655370fd64')

package() {
  install -Dm755 "./daptin" "${pkgdir}/usr/bin/daptin"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
