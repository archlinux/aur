pkgname=expl
pkgver=1.0.0
pkgrel=1
pkgdesc="Universal Linux package manager for AppImage packages"
arch=('x86_64')
url="https://github.com/ItzSkater/expl"
license=('GPL3')
depends=('zstd')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ItzSkater/expl/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/expl "$pkgdir/usr/bin/expl"
}
