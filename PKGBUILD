# Maintainer: Pixel

pkgname=walrs
pkgver=1.1.3
pkgrel=1
pkgdesc="Generate colorscheme from image"
arch=('x86_64' 'aarch64')
url="https://github.com/Pixel2175/walrs"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rustup' 'cargo' 'git' 'make')
source=("git+https://github.com/Pixel2175/walrs.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  rustup default stable
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/walrs "$pkgdir/usr/bin/walrs"
  mkdir -p ~/.cache/walrs/
  cp -r templates/ scripts/ colorschemes/ "$pkgdir~/.cache/walrs"
}

