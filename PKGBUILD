# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=pinact-bin
pkgver=5.0.2
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
sha256sums_x86_64=('7f003d8f51e984c2264d2009d430e3e0e87ae404a0e2dc2a9a277b0f731bf5b7')
sha256sums_aarch64=('326e27f5b3b5fca21e6a169b2785ba2023df3dd9ee82dd0f4e438cb1220b68d7')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
