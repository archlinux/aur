# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname=snake
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple lightweight terminal snake game"
arch=('any')
url="https://github.com/PonasKovas/snake"
license=('MIT')
makedepends=('cargo')
source=("https://github.com/PonasKovas/snake/archive/${pkgver}.tar.gz")
md5sums=('f8df96f4501fddd597fd92ff5d903211')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/snake "${pkgdir}/usr/bin/snake"
}