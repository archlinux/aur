# Maintainer: Rootly <твой@имейл.com>
pkgname=dotmaster-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Interactive dotfiles installer written in Rust"
arch=('x86_64')
url="https://github.com/Minish777/dotmaster"
license=('MIT')
depends=('gcc-libs' 'git')
makedepends=('cargo')
provides=('dotmaster')
conflicts=('dotmaster')
source=("git+https://github.com/Minish777/dotmaster/tree/main/dotmaster-git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/dotmaster"
  cargo build --release --locked
}

package() {
  cd "$srcdir/dotmaster"
  install -Dm755 "target/release/dotmaster" "$pkgdir/usr/bin/dotmaster"
}