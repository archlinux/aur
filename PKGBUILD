# Maintainer: Abigail G <me@kb6.ee>
pkgname=espresso-logic
pkgver=1.1
pkgrel=2
pkgdesc="The espresso PLA logic minimization program"
arch=('x86_64')
depends=('glibc')
url="https://github.com/galengold/espresso-logic"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://github.com/classabbyamp/$pkgname/archive/$pkgver.tar.gz)
md5sums=('611f8b45b2828402aae791364bc9b6d5')

build() {
  cd "$pkgname-$pkgver/espresso-src"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "./bin/espresso" "$pkgdir/usr/bin/espresso"
  install -Dm644 "./man/espresso.1" "$pkgdir/usr/share/man/man1/espresso.1"
  install -Dm644 "./man/espresso.5" "$pkgdir/usr/share/man/man5/espresso.5"
  install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/examples/" ./examples/*
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/hard_examples/" ./hard_examples/*
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/tlex/" ./tlex/*
}
