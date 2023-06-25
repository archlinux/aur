pkgname=kalc
pkgver=0.7.1
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector, cli calculator with real-time output"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('1c70a5d42091346fe6ff6792153bbc1fac2fa5f21a27a8b3cf4ac6b8ec84dd89d172aa30f8180adbda235d541659d48126b76eb71ac0601d560babaf77e6abab')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
