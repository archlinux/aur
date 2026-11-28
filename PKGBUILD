# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fauxrpc-bin
pkgver=0.30.0
pkgrel=1
pkgdesc="Fake gRPC, Connect and REST server from Protobuf and OpenAPI specs"
arch=('x86_64' 'aarch64')
url="https://github.com/sudorandom/fauxrpc"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fauxrpc_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/fauxrpc_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('644cd27ce054d91d6d34b250db65a8f26c52af30d50e0f9ba456ea621393e405')
sha256sums_aarch64=('de86e07a82dfbb78fa25b161250bbf9fc10e0528c4eda5bb621170d75f7aba15')

package() {
  install -Dm755 "fauxrpc" "${pkgdir}/usr/bin/fauxrpc"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
