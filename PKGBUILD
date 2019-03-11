# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=broot
pkgver=0.7.1
pkgrel=1
pkgdesc='Fuzzy Search + tree + cd'
arch=('x86_64')
url=https://github.com/Canop/broot
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/broot-v$pkgver.tar.gz")
sha512sums=('3196425046cbc7e3187d5ab42d087a125f2bd29a17816126be877c234d49cd883b51c286b5f20bb282acbfe95cdcef270efa84c11032bf54609047ef579ad70a')

build() {
  cd broot-$pkgver
  cargo build --release --locked
}

package() {
  cd broot-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/broot
  install -Dm644 -t "$pkgdir"/usr/share/licenses/broot LICENSE
}

# vim:set ts=2 sw=2 et:
