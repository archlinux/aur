# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=quien-bin
pkgver=0.1.1
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
sha256sums_x86_64=('17a8e93cab293bacc3c7fc191a63354ac6390088a1381bfb273b4a017820b98a')
sha256sums_aarch64=('4ab8d29c9105b3b7aa334df7b59f34ce11d3e5702b154ff46338a0baa82eea5c')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
