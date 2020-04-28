# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=oha
pkgver=0.2.4
pkgrel=1
pkgdesc="Ohayou(おはよう), HTTP load generator, inspired by rakyll/hey with tui animation"
arch=('x86_64')
url="https://github.com/hatoo/oha"
license=(MIT)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::https://github.com/hatoo/oha/archive/${pkgver}.tar.gz)
sha512sums=('117e004e6cfc952939d902a3e7ff1ab3352e4040e4f047971ce8306e52052d914dab93bef096c5fcb92aaf92af0e23251625b738f486c057283932e690145deb')

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
