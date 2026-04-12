# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=quien-bin
pkgver=0.4.1
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
sha256sums_x86_64=('e82fa944a2540c25618d976d2a0f5336a851a832264d044f1af2afb5980387e7')
sha256sums_aarch64=('e0579434c287366eeb48ca8c4e0b9f975fca166324b5ccd2d53189f8699fd532')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
