# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=pinact-bin
pkgver=3.9.0
pkgrel=3
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
sha256sums_x86_64=('3829da718de38b1e914b974c3e77045a256999af84789437a7305b09130d8a6a')
sha256sums_aarch64=('34a957423002662c6289782b571660beda6a37449a76d763c8ad8b1b9a500a54')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
