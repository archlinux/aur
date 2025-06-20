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
sha256sums=('e059a1fc3d3e5220d7b290cf712712d4b587087e319b1edc19084d1415ba0730')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
