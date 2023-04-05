# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=typst-lsp
pkgver=0.3.1
pkgrel=1
pkgdesc="Language server for Typst"
arch=('i686' 'x86_64')
url="https://github.com/nvarner/typst-lsp"
license=('apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/nvarner/typst-lsp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('27530f8e2e68954faefa0859151de52951d986ef2a5e0f67b6e76e568d285549')


check() {
  cd "typst-lsp-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "typst-lsp-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE-MIT.txt" -t "$pkgdir/usr/share/licenses/typst-lsp"
}
