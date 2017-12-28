# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=oxipng
pkgver=0.18.3
pkgrel=1
pkgdesc="A lossless PNG compression optimiser"
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'arm' 'aarch64')
url="https://github.com/shssoichiro/oxipng"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shssoichiro/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9d513174eb054f701567c3c24701106fba0fe196c8467df7a627cd8b57b573fe')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/oxipng "$pkgdir/usr/bin/oxipng"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
