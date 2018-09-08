# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=pax-rs
_pkgname=pax
pkgver=0.4.0
pkgrel=1
pkgdesc="The fastest JavaScript bundler in the galaxy."
arch=('x86_64')
url="https://github.com/nathan/pax"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/nathan/pax/archive/pax-v${pkgver}.tar.gz)
sha512sums=('a9e32539ab661f93772a5c5c9a07c90cc23097fa119f88c909cc4b2288b95f910ed94c9af35365c44a5c2be79ca1674d81f96abf8d0cbddaf615e7654928c5e5')

build() {
  cd "$srcdir/$_pkgname-$_pkgname-v$pkgver"

  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname-$_pkgname-v$pkgver"

  install -Dm755 target/release/px "$pkgdir"/usr/bin/px
}

# vim:set ts=2 sw=2 et:
