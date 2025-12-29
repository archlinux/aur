pkgname=xls
pkgver=0.0.1
pkgrel=1
pkgdesc="Small ls tool written in rust"
arch=('x86_64')
url="https://github.com/x64-OSS/xls"
license=('MIT')
makedepends=('cargo' 'git')
source=("git+$url")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  cargo install \
    --locked \
    --path . \
    --root "$pkgdir/usr"
}

