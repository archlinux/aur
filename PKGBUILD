# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=ztatusbar
pkgver=0.1.0
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot. Made in Zig with toml file configuation."
arch=('x86_64')
url="https://github.com/javiorfo/ztatusbar"
license=('MIT')
depends=('curl' 'xorg-xsetroot')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/ztatusbar-$pkgver.tar.gz")
sha512sums=('f94d403d331f67f709ffd4050f1ef154fe3a028a81dff0e9bde73d0e04f8a0c40f69ccea2f11a92e8aa60ae1ed74d655de6605fa76fda8b78d14d35aa57edb07')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
