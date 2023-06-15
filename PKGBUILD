pkgname=kalc
pkgver=0.6.4
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, cli calculator with real-time output"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('77eb0bb1812511d7fa5f352045053e0ac23c9867d8a8d0589db6debd8eec4ffc5a966001c33e1a2ad4ba20fc7dcad2ce945bfc08211abdbdf49ab7fe1880ef83')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
