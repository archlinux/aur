Maintainer: stevenx65 stevenxy35@gmail.com
pkgname=opal-tui
pkgver=1.0.0
pkgrel=1
pkgdesc="Beautiful terminal music player built with Rust"
arch=('x86_64')
url="https://github.com/stevenx65/opal-tui"
license=('MIT')
depends=('alsa-lib' 'glib2')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
