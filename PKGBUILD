pkgname=kalc
pkgver=0.6.2
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, cli calculator with real-time output"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('439f2c771ba29fcfba4ec61d3260ad27638a3e81e61db486ab653597fffe7d17fe50de3d709c41b33d20cc36f9d4457c6d8dbaaafce61faac547da6a307b9e96')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
