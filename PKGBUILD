# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator
pkgver=0.2.0
pkgrel=2
pkgdesc="A simple terminal-based TOTP authenticator written in Rust"
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator.git"
license=('GPL3')
depends=('glibc')
makedepends=('rust' 'git')
source=("git+https://github.com/clauderarch/kripton-authenticator.git#branch=main")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
