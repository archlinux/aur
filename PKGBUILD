# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=rstatusbar
pkgver=0.4.0
pkgrel=2
pkgdesc="Configurable statusbar for Xorg server using xsetroot. Made in Rust with toml file configuation."
arch=('x86_64')
url="https://github.com/javiorfo/rstatusbar"
license=('MIT')
depends=('rust' 'cargo' 'xorg-xsetroot')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('6369569f18f483b96bb43c68ce72a473518f3f548e1b67aa0014d173eea983d39aaac73371c41fc09bdfebdb4d9709cbf548f86eef4fd2c0380d2ef83841f03e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
