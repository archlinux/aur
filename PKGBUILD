# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=rstatusbar
pkgver=0.2.0
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot. Made in Rust with toml file configuation."
arch=('x86_64')
url="https://github.com/javiorfo/rstatusbar"
license=('MIT')
depends=('curl' 'xorg-xsetroot')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/rstatusbar-$pkgver.tar.gz")
sha512sums=('a67acd50d9feb9e69a8facef694d3dfd98f10897f46a0f2446b3c61ac916f3a846e26543dc05080f2d35918f67c9a7d0cca2dbf967cfa964f54031885786ee73')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
