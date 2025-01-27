# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=ztatusbar
pkgver=0.1.2
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot. Made in Zig with toml file configuation."
arch=('x86_64')
url="https://github.com/javiorfo/ztatusbar"
license=('MIT')
depends=('curl' 'xorg-xsetroot')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/ztatusbar-$pkgver.tar.gz")
sha512sums=('e612e03e60559336bd4f58cc5c8e4a420d559064d811d1971992392da32c8195853d8f7cde3982b73aae2bc4bf68427e342519583336ab19642235f687aebfed')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
