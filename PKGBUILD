# Maintainer: Ponas <mykolas.peteraitis@gmail.com>
pkgname="rlaunch"
pkgver=1.3.11
pkgrel=1
pkgdesc="A fast, light-weight and modern application launcher"
arch=('x86_64')
url="https://github.com/PonasKovas/rlaunch"
license=('MIT')
makedepends=('cargo'
			 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/PonasKovas/rlaunch/archive/${pkgver}.tar.gz")
md5sums=('d7c52a9cde6573f7d7b98bf4cffa22fd')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/rlaunch "${pkgdir}/usr/bin/rlaunch"
}
