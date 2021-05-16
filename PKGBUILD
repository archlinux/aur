# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="rlaunch"
pkgver=1.3.13
pkgrel=1
pkgdesc="A fast, light-weight and modern application launcher"
arch=('x86_64')
url="https://github.com/PonasKovas/rlaunch"
license=('MIT')
makedepends=('cargo'
			 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PonasKovas/rlaunch/archive/${pkgver}.tar.gz")
md5sums=('e5b6158ab89de7bd8aff799845ababa0')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    RUSTFLAGS="-Ctarget-cpu=native" cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/rlaunch "${pkgdir}/usr/bin/rlaunch"
}
