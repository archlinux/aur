# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=pinact-bin
pkgver=4.1.1
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
sha256sums_x86_64=('d1cffebe5704b74e2e5f8a864efb9f7e54768972dc686188c008033fb1797841')
sha256sums_aarch64=('dd1f29908319ed3e59f9fe6b39196efbb76936357f3bd741cd759a96306ae8d8')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
