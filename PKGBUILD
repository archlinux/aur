# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=pinact-bin
pkgver=3.7.4
pkgrel=1
pkgdesc='pinact is a CLI to edit GitHub Workflow and Composite action files and pin versions of Actions and Reusable Workflows. pinact can also update their versions and verify version annotations.'
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
sha256sums_x86_64=('dbbb251a6334bf06110d5365cfc9b1d6213472df3be34698ecb1fbeba9fbcba0')
sha256sums_aarch64=('08f90bc25fa6e136f4269f3dae1503bc5253aadb78221ee1a02c6ce904fd8c51')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}

