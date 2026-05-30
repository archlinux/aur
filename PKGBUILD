# Maintainer: Comma, Marmarek-here (on GitHub)
pkgname=archbrew
pkgver=1.0.0
pkgrel=1
pkgdesc="Homebrew-like standalone CLI package manager for Arch"
arch=('x86_64')
url="https://github.com/Marmarek-here/ArchBrew"
license=('MIT')
depends=('glibc' 'pacman')
makedepends=('cargo')
optdepends=()
source=()
sha256sums=()

build() {
  cd "$startdir"
  cargo build --release --locked
}

check() {
  cd "$startdir"
  cargo test --locked
}

package() {
  cd "$startdir"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  ln -sf "$pkgname" "$pkgdir/usr/bin/brew"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
