# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=nodepass-bin
pkgver=1.17.0
pkgrel=1
pkgdesc="TCP and UDP tunneling over pre-established TCP, QUIC, WebSocket or HTTP/2 connections"
arch=('x86_64' 'aarch64')
url="https://github.com/NodePassProject/nodepass"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/nodepass_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/nodepass_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7141314b3f13f5e4bf6a9ce281a9a909c25d9d03e5b83c7697ac7544fce18d6a')
sha256sums_aarch64=('0999316ab264616571920e30b0fc8565f8398ed780297f8def6a5b1f544e35db')

package() {
  install -Dm755 "nodepass" "${pkgdir}/usr/bin/nodepass"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
