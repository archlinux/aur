# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=zola
pkgver=0.10.0
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('x86_64')
url="https://github.com/getzola/zola"
depeds=(libsass)
makedepends=(cargo cmake git)
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getzola/zola/archive/v${pkgver}.tar.gz")
sha256sums=('af8160f1536c9b69153dc041a2e23f359b6acb2a9a2235333e887397d8a6634d')

build() {
  cd zola-$pkgver
  cargo build --release --locked
}

check() {
  cd zola-$pkgver
  cargo test --release --locked
}

package() {
  cd zola-$pkgver
  install -Dm755 target/release/zola "$pkgdir"/usr/bin/zola
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
