# Maintainer: Abdullah Koyuncu <wisewebworks@outlook.com>
pkgname='youtube-chat-rs-git'
pkgver=0.1.0
pkgrel=1
pkgdesc='Rust crate to fetch YouTube live chat messages'
arch=('x86_64')
url="https://github.com/efekrskl/youtube-chat-rs"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  grep -m1 '^version' Cargo.toml \
    | sed 's/version *= *"\(.*\)"/\1/'
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/youtube-chat-rs" "$pkgdir/usr/bin/youtube-chat-rs"
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/youtube-chat-rs/LICENSE"
}
