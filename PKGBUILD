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
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/i0f/tsh/archive/v$pkgver.tar.gz")
b2sums=('b4d50e3ba2b5750664bc90139e28c51cbfe60f9e81b464b3f2807f599967b968d9a0f0b0af586ed92c07060bf55b766c1027c4f50602b8ce6750ace15c04dcd2')

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
