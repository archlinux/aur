# Maintainer: Made by meepo2k17 any qeustions matviy.khomchak@gmail.com
pkgname=mippfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal Rust-based system fetch tool like neofetch"
arch=('x86_64')
url="https://github.com/tyyyyyyp/mippfetch"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("git+https://github.com/tyyyyyyp/mippfetch.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/mippfetch"
  cargo build --release --target-dir=target
}

package() {
  cd "$srcdir/mippfetch"
  install -Dm755 "target/release/mippfetch" "$pkgdir/usr/bin/mippfetch"
  install -Dm644 "mippfetch.conf" "$pkgdir/etc/mippfetch/mippfetch.conf"
}


