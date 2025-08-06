pkgname=cmdcreate
pkgver=0.4.6
pkgrel=1
arch=('x86_64')
url="https://github.com/Meme-Supplier/cmdcreate"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
source=("git+https://github.com/Meme-Supplier/cmdcreate.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/cmdcreate" "$pkgdir/usr/bin/cmdcreate"
}
