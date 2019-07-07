pkgname=electrs
pkgver=0.7.0
pkgrel=1
pkgdesc="An efficient re-implementation of Electrum Server in Rust"
arch=(x86_64)
url="https://github.com/romanz/electrs"
license=('MIT')
depends=('rust')
makedepends=('git' 'clang' 'cmake')
source=("git+https://github.com/romanz/electrs.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"

}

build() {
  cd "$pkgname"
  cargo build --release
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
