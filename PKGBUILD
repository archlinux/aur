# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=tty-solitaire
pkgver=1.1.1
pkgrel=1
pkgdesc='ncurses-based klondike solitaire game'
arch=('x86_64')
url=https://github.com/mpereira/tty-solitaire
license=('MIT')
depends=('ncurses')
source=("$url/archive/v$pkgver/tty-solitaire-$pkgver.tar.gz")
sha512sums=('467a41d75e65ab59e9fb011fc4776d5e746c1cba523ecb8e43b2954ad9454f07ac2eda2cc8c0be9f6769ee70b4e15a4973f45310604ab734e56196824d5330c6')

build() {
  cd tty-solitaire-$pkgver
  make
}
package() {
  cd tty-solitaire-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
