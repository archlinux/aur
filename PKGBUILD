# Maintainer: i0f <i0f@posteo.net>
pkgname=tsh
pkgver=0.1.0
pkgrel=1
pkgdesc="A Rust CLI tool that fetches a random hot post from r/twosentencehorror."
arch=('x86_64')
url="https://codeberg.org/i0f/tsh"
license=('MIT')
depends=('glibc' 'openssl' 'gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("git+$url.git#tag=v$pkgver")
b2sums=('cb2e06c26fae4a0b064b78eb7ea7d7ab3af40906a8895816a1e439c9cab52c5d63b882663631daba4b6da60659c2ec3c5bc29c713b0b7066f5f7d9db25d0927d')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/tsh "$pkgdir/usr/bin/tsh"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
