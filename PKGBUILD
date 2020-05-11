# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="rlaunch"
pkgver=1.3.9
pkgrel=2
pkgdesc="A fast, light-weight and modern application launcher"
arch=('x86_64')
url="https://github.com/PonasKovas/rlaunch"
license=('MIT')
makedepends=('cargo'
			 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PonasKovas/rlaunch/archive/${pkgver}.tar.gz")
md5sums=('d8ef5151892e7e53f9c8a375b61d42ec')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/rlaunch "${pkgdir}/usr/bin/rlaunch"
}
