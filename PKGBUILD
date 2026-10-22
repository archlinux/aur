# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=pinact-bin
pkgver=5.0.1
pkgrel=1
pkgdesc='CLI to edit GitHub Workflow and Composite action files and pin versions of Actions and Reusable Workflows.'
arch=('x86_64' 'aarch64')
url=https://github.com/suzuki-shunsuke/pinact
license=(MIT)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(
  ${pkgname%-bin}-amd64-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_linux_amd64.tar.gz
)
source_aarch64=(
  ${pkgname%-bin}-arm64-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_linux_arm64.tar.gz
)
sha256sums_x86_64=('12500c0fff5db94a0155e2e76ed959d1dc0e899056ee168d8fb7b4840e7c04f0')
sha256sums_aarch64=('fc1432004f378ae51d549a356195b4d2e3ee05935dbd20e3bbca66db1cdf6590')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
