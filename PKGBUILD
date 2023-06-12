pkgname=kalc
pkgver=0.6.3
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, cli calculator with real-time output"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ae440334d65575e0e535fbf2c20092467477cb3ec2769d2a8aba86aa837580f54c9bbb7f9cb768ab5a519cba60699be19a088c86be80a36ed55b4c3b2b2ab363')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
