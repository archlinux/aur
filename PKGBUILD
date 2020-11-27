# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=drill
pkgver=0.7.0
pkgrel=1
pkgdesc="HTTP load testing application written in Rust inspired by Ansible syntax"
url="https://github.com/fcsonline/drill"
depends=('openssl')
makedepends=('cargo')
arch=('x86_64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0041e4b8e8bae0bfc4dfc42b0d1c9a65a8a04dfb68766138d3ae85407e42b15f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 example/*.yml -t "$pkgdir/usr/share/drill/example/"
  cd target/release
  install -Dm755 drill "$pkgdir/usr/bin/drill-rs"
}
