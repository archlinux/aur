# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=quien-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='A better WHOIS lookup tool'
arch=('x86_64' 'aarch64')
url=https://github.com/retlehs/quien
license=(MIT)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(
  ${pkgname%-bin}-amd64-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_linux_amd64.tar.gz
)
source_aarch64=(
  ${pkgname%-bin}-arm64-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_linux_arm64.tar.gz
)
sha256sums_x86_64=('be6d0f82f87a11682db283e31344941ae5b7760c7f4f2601b17f933f347b45c4')
sha256sums_aarch64=('9fcd16141a300918ac3e2062e33e12ecf3bbf61fd9229d23e7368c0a881079e9')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
