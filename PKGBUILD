# Maintainer: danb <danb@hasi.it>
pkgname=rawr
pkgver=0.1
pkgrel=1
pkgdesc="An instant file sharing tool that respects your privacy by not caching any files"
arch=('x86_64')
url="https://gitlab.hasi.it/danb/rawr"
license=('GPL3')
makedepends=('rustup')

build() {
  cd "$pkgname-$pkgver"

  rustup default nightly
  cargo build --release --locked --features 'tls'
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/rawr" "$pkgdir/usr/bin/rawr"
}
