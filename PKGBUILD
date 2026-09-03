# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=tailcat-bin
pkgver=0.5.0
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
sha256sums_aarch64=('020be04b7136df7660c1aa5edf38b6bcf82854349383ed19c4b386290bc2ed4f')
sha256sums_x86_64=('62954edcabbf360171a921bb4446eb03ed3b95ad529a4884671abb902e232bf4')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
