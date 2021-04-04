# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=drill
pkgver=0.7.1
pkgrel=1
pkgdesc="HTTP load testing application written in Rust inspired by Ansible syntax"
url="https://github.com/fcsonline/drill"
depends=('openssl')
makedepends=('cargo')
arch=('x86_64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('76e9f0fdcc369d27246029d077f9fb8b0c5b80be2cd07a65a78f7883b993fd80')

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
