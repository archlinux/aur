# Maintainer: pwnwriter < hey@pwnwriter.xyz >

pkgname=kanha-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="🦚 A web-app pentesting suite written in Rust."
arch=('x86_64')
url="https://github.com/pwnwriter/kanha"
license=('MIT')
depends=('openssl' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/kanha-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('e168fbadfcce2b0db12fdff89a9ab21bfb782fce7e2b0a09a84e67f5604471dbf9f3eb984d219c69df989f50320d0f82dc99002a244af86d38cf7c9ccd2f0e35')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")


package() {
  cd "${pkgname%-bin}-$pkgver"
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
