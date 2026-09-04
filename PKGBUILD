

pkgname=uutils-grep
pkgver=0.2.0
pkgrel=1
pkgdesc="Rust implementation of grep"
arch=('x86_64')
url=https://github.com/uutils/grep
license=('MIT')
depends=(gcc-libs oniguruma)
makedepends=(pkgconf rust)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('fc7054b4997061140bcee258ed46dac1b8562daa27f57c6b7768ba679dad925af29dd8ba86f14b9ac446c38de428c506ae943611120e1c4fc93471c9022d007c')

build(){
  cd grep-$pkgver
  cargo build --release
}

package() {
  cd grep-$pkgver
  install -Dm755 target/release/grep "$pkgdir"/usr/bin/uu-grep
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
