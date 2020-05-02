# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=oha
pkgver=0.2.5
pkgrel=1
pkgdesc="Ohayou(おはよう), HTTP load generator, inspired by rakyll/hey with tui animation"
arch=('x86_64')
url="https://github.com/hatoo/oha"
license=(MIT)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::https://github.com/hatoo/oha/archive/v${pkgver}.tar.gz)
sha512sums=('b581df1b41a68f9e7011ef501bd2809e813228280e87b4f172fef4b017074c8a70dd7c011e9a841a2b9a7ae0bf8927f0d31b8cf92e52f1cf2a15ee17b024917c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/oha "$pkgdir"/usr/bin/oha
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
