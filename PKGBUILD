# Maintainer: venoosoo
pkgname=folder-size
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI tool to calculate folder sizes with options like symlink following and depth limits"
arch=('x86_64')
url="https://github.com/venoosoo/folder-size"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
source=("git+https://github.com/venoosoo/folder-size.git#tag=v${pkgver}")
sha256sums=('1800f19c2b0e02052732cf3c0ef19d4394535b4087b9588f5d57e87ce71121a1')


build() {
  cd "$srcdir/$pkgname-$pkgver/src/hello_rust"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src/hello_rust"
  install -Dm755 "target/release/folder-size" "$pkgdir/usr/bin/folder-size"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

