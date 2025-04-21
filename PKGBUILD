# Maintainer: Abdullah Koyuncu <wisewebworks@outlook.com>
pkgname='gj-git'
pkgver=0.2.0
pkgrel=1
pkgdesc='gj is a dead simple journaling CLI. Type your thoughts into the terminal — they get logged to Notion, one page per day. No clutter, no fuss.'
arch=('x86_64')
url="https://github.com/efekrskl/gj"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"  # Doğru dizine git
  install -Dm755 "target/release/gj" "$pkgdir/usr/bin/gj"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/gj/LICENSE"
}
