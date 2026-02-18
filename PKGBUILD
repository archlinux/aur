# Maintainer: Julien Virey <julien.virey@gmail.com>
#
pkgname=sql-tap-bin
pkgver=0.1.1
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
sha256sums_x86_64=('664e657f8f3e56c246519f7c3cadda9ee5a04e53222050e7401076ac1b1c8eea')
sha256sums_aarch64=('4694e69a94fd5ae6e01d29c0f81f23f80123bfb55cdc993c46d84510a13c81c1')

package() {
  install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm755 "${pkgname%-bin}d" "${pkgdir}/usr/bin/${pkgname%-bin}d"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}

