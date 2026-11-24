# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=sql-tap-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Watch SQL traffic in real-time with a TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/mickamy/sql-tap"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(
  ${pkgname%-bin}-amd64-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz
)
source_aarch64=(
  ${pkgname%-bin}-arm64-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz
)
sha256sums_x86_64=('53d8d7cf4645d7eaa9530f80385daebf3206ae7b868274b452c3211fddd690bf')
sha256sums_aarch64=('57a57262a4d165fe77037a1cfc0e70305a74df3b8978de5d2046b13827f2dd2c')

package() {
  install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm755 "${pkgname%-bin}d" "${pkgdir}/usr/bin/${pkgname%-bin}d"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
