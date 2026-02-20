# Maintainer: Julien Virey <julien.virey@gmail.com>
#
pkgname=sql-tap-bin
pkgver=0.2.0
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
sha256sums_x86_64=('83f06293af00e47049fd32c5ca9331911b2cee9de9460977af93c90cd81906e9')
sha256sums_aarch64=('65f062afc3c130a82be59b65b3e2f617ba4dff98cb089b03eeef3d0e4ea0e991')

package() {
  install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm755 "${pkgname%-bin}d" "${pkgdir}/usr/bin/${pkgname%-bin}d"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}

