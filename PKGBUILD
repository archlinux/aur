# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=tailcat-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="like netcat, but over Tailscale's data plane, without Tailscale's control plane"
url='https://github.com/tailscale/tailcat'
arch=(aarch64 x86_64)
license=(BSD-3-Clause)
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(
  ${pkgname%-bin}-amd64-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz
)
source_aarch64=(
  ${pkgname%-bin}-arm64-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz
)
sha256sums_aarch64=('b88d8ca36d0aff233987a2551237d63d51f4f7bf1b4f6542c7d721a7eebb4969')
sha256sums_x86_64=('42ee6acb92ac0a6d778bf803aab1dc76fbc3f576c6489ca1be854efcb4641899')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
