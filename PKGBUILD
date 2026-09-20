# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=tailcat-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="like netcat, but over Tailscale's data plane, without Tailscale's control plane"
url='https://github.com/tailscale/tailcat'
arch=(aarch64 x86_64)
license=(BSD-3-Clause)
depends=(glibc)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(
  ${pkgname%-bin}-amd64-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz
)
source_aarch64=(
  ${pkgname%-bin}-arm64-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz
)
sha256sums_aarch64=('bbb1ab50f24f00effe1e1fd86d0501803fb80793a90785a2a16ff3428f03d8ef')
sha256sums_x86_64=('23c0b1887a5ec422f0d18a9c52b4f5357815febdaae738a1eb54036d10bd9ee6')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
