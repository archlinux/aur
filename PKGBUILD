# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=quien-bin
pkgver=0.6.0
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
sha256sums_x86_64=('92c39956a6c9fb738d506784e80a7a4e77d415aafd5de41794b443bb839ebacd')
sha256sums_aarch64=('3b7bcbe48e4afa1cc50f8527ea038eb3db8a2966b269809f0e634895b1390adb')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
