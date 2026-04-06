pkgname=spex
pkgver=1.1.0
pkgrel=1
pkgdesc="Wallpaper-based dynamic color generator"
arch=('x86_64')
url="https://github.com/Grey-007/spex"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('spex')
conflicts=('spex-bin')
source=("git+https://github.com/Grey-007/spex.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!debug')

build() {
  cd "$srcdir/spex"
  cargo build --release
}

package() {
  cd "$srcdir/spex"

  install -Dm755 target/release/spex "$pkgdir/usr/bin/spex"
  install -Dm755 target/release/spex-convert "$pkgdir/usr/bin/spex-convert"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/spex/LICENSE"
}