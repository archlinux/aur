# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.5.0
pkgrel=1
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/broot-v$pkgver.tar.gz")
sha512sums=('713bfc5c8688a9852769f752541a577d986f8ff0aa70aa60c2695e286ca334361e96d160fb5c2a2746bf7545d0cfbbad4786eaf79a459b4b3cab5a4ba928e031')

build() {
  cd broot-$pkgver
  cargo build --release --locked
}

check() {
  cd broot-$pkgver
  cargo test --release --locked
}

package() {
  cd broot-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/broot
  install -Dm644 -t "$pkgdir"/usr/share/licenses/broot LICENSE
}

# vim:set ts=2 sw=2 et:
