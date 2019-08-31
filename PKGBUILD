# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname=snake
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple lightweight terminal snake game"
arch=('any')
url="https://github.com/PonasKovas/snake"
license=('MIT')
makedepends=('cargo')
source=("https://github.com/PonasKovas/snake/archive/${pkgver}.tar.gz")
md5sums=('fc422a7da4e5b97d3c20cc6968c4da3a')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/snake "${pkgdir}/usr/bin/snake"
}