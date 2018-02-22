# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=oxipng
pkgver=1.0.1
pkgrel=1
pkgdesc="A lossless PNG compression optimiser"
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'arm' 'aarch64')
url="https://github.com/shssoichiro/oxipng"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shssoichiro/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e8e13d8541d3a06799062aa275097d6aa298b0534ef383f9e884c3d47de73d42')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/oxipng "$pkgdir/usr/bin/oxipng"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
