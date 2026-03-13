# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=sql-tap-bin
pkgver=0.2.9
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
sha256sums_x86_64=('f7ab4f58570d423919cb9f7540b996c0c972ee2dd86544a3869f16c1e306aa3e')
sha256sums_aarch64=('506f2e0f347ad8bd7f7dab57d15c5ac646f00e51f7a74b81938198e39b35a908')

package() {
  install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm755 "${pkgname%-bin}d" "${pkgdir}/usr/bin/${pkgname%-bin}d"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}

