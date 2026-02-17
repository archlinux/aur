# Maintainer: Julien Virey <julien.virey@gmail.com>
#
pkgname=sql-tap-bin
pkgver=0.1.0
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
sha256sums_x86_64=('d49c7b20825e9f13a205bae35ae5ea09483262246c6e3d4558553b086680434d')
sha256sums_aarch64=('3aff328244fa7d79730172ff9f61558d9ce32dd0c21ce98a2623eff5fd5cfc27')

package() {
  install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm755 "${pkgname%-bin}d" "${pkgdir}/usr/bin/${pkgname%-bin}d"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}

