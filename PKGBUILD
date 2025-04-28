# Maintainer: Pixel

pkgname=walrs
pkgver=1.0.6
pkgrel=1
pkgdesc="A fast color scheme generator"
arch=('x86_64' 'aarch64')
url="https://github.com/Pixel2175/walrs"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'make')
source=("git+https://github.com/Pixel2175/walrs.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/walrs "$pkgdir/usr/bin/walrs"
  install -d "$pkgdir/etc/walrs/templates"
  cp -r templates/* "$pkgdir/etc/walrs/templates/"
}

