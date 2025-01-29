# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=ztatusbar
pkgver=0.1.3
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot. Made in Zig with toml file configuation."
arch=('x86_64')
url="https://github.com/javiorfo/ztatusbar"
license=('MIT')
depends=('curl' 'xorg-xsetroot')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/ztatusbar-$pkgver.tar.gz")
sha512sums=('61cc032093709e674fd579767ec18593b9a7d783c812fcbdc3e6df3558e86ce84a013cd60d8249baa392da56b4e1d546c727263409938271c75d0756d874da1b')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
