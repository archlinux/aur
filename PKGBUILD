pkgname=kalc
pkgver=0.6.1
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, cli calculator with real-time output"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('120e6230c6a16a8cf893ae82cfa811dc210f3ec3030dcf4aa8c6a38edce97ffe376de4ba69135b65c390a35821c7352567a06f2915354076ec8f063ed5f5cc3a')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
