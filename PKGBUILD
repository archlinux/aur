# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator
pkgver=0.2.0
pkgrel=3
pkgdesc="A simple terminal-based TOTP authenticator written in Rust"
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator.git"
license=('GPL3')
depends=('glibc')
makedepends=('rust' 'git')
source=("https://github.com/clauderarch/kripton-authenticator/archive/9dd06e8a060c726351c2893d8fdd4c6555fc236e.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-9dd06e8a060c726351c2893d8fdd4c6555fc236e"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-9dd06e8a060c726351c2893d8fdd4c6555fc236e"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
