# Maintainer: Pixel

pkgname=pino-rs
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple pretty minimal notification app for Unix (X11)"
arch=('x86_64' 'aarch64')
url="https://github.com/Pixel2175/pino-rs"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'make')
source=("git+https://github.com/Pixel2175/pino-rs.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/pino "$pkgdir/usr/bin/pino"
}

