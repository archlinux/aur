# Maintainer: Tim Koornstra <89044870+TimKoornstra@users.noreply.github.com>
pkgname=repoyank
pkgver=0.3.0
pkgrel=1
pkgdesc="Interactively select files from a repo and yank them as LLM-ready snippets to the clipboard"
arch=('x86_64')
url="https://github.com/TimKoornstra/repoyank"
license=('GPL3')
depends=('gcc' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/repoyank" "$pkgdir/usr/bin/repoyank"
}

