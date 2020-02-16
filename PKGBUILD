# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="rlaunch"
pkgver=1.3.5
pkgrel=1
pkgdesc="A fast, light-weight and modern application launcher"
arch=('x86_64')
url="https://github.com/PonasKovas/rlaunch"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PonasKovas/rlaunch/archive/${pkgver}.tar.gz")
md5sums=('2161500a8de4325c37fe706f4b2787f9')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/rlaunch "${pkgdir}/usr/bin/rlaunch"
}
