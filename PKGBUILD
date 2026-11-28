# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=p2ptunnel-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="P2P TCP and UDP tunneling tool for reaching hosts behind NAT"
arch=('x86_64' 'aarch64')
url="https://github.com/chenjia404/p2ptunnel"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/p2ptunnel_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/p2ptunnel_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('396b1e98e777eca9cff40ad4fab67258bbc02e4b9f8c0ab77bcb9bb73e8ca6b1')
sha256sums_aarch64=('5e502e518f9892633d7b30ec9ece00c261820e2e65362581475cb9b932d8a222')

package() {
  install -Dm755 "p2ptunnel" "${pkgdir}/usr/bin/p2ptunnel"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
