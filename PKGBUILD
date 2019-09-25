# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proxyboi
pkgver=0.3.0
pkgrel=1
pkgdesc="A super simple reverse proxy with TLS support"
arch=('x86_64')
url="https://github.com/svenstaro/proxyboi"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/proxyboi/archive/${pkgver}.tar.gz)
sha512sums=('2f5e7870a3aef0f157598fe726f0d09e3aaf90278d44a4bb771e61c4cca1243b7030abdb704ac70a5169d4489fab9c0c1a954c39a5ab77f816763fa8a5402d29')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/proxyboi "$pkgdir"/usr/bin/proxyboi
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
