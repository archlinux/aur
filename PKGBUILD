# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=dbdeployer-bin
pkgver=2.5.0
pkgrel=1
pkgdesc='A tool that deploys MySQL database servers easily.'
arch=('x86_64' 'aarch64')
url=https://github.com/ProxySQL/dbdeployer
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=(Apache-2.0)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(
  $url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.linux_amd64.tar.gz
)
source_aarch64=(
  $url/releases/download/v$pkgver/${pkgname%-bin}-$pkgver.linux_arm64.tar.gz
)
sha256sums_x86_64=('544fa5883445064c732499a28ecb92d666c57cb5284a9b81f95122cceebff3eb')
sha256sums_aarch64=('aeb717b86af1fb7b2bed14c1a08f001e25c5701bfdbb9d44f9ab71526c488725')

case ${CARCH} in
  x86_64) _CARCH='amd64' ;;
  aarch64) _CARCH='arm64' ;;
esac

package() {
  install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
