# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=oxipng
pkgver=0.17.0
pkgrel=1
pkgdesc="A lossless PNG compression optimiser"
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'arm' 'aarch64')
url="https://github.com/shssoichiro/oxipng"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shssoichiro/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b06701046f734fc0adb7020ab276d3c5da3e5b0169067c781215fdd95b3d7db4')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/oxipng "$pkgdir/usr/bin/oxipng"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
