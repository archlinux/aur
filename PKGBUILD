pkgname=cmdcreate
pkgver=0.7.0
pkgrel=1
arch=('x86_64')
url="https://github.com/Meme-Supplier/cmdcreate"
license=('MIT')
depends=('bash' 'curl' 'nano')
makedepends=('cargo' 'git' 'rustup')
pkgdesc="Allows you to create custom commands for your custom scripts"
source=("git+https://github.com/Meme-Supplier/cmdcreate.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  rustup default nightly
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/cmdcreate" "$pkgdir/usr/bin/cmdcreate"
}
