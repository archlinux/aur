# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>

pkgname=rofi-emoji
pkgver=1.0.0
pkgrel=1
pkgdesc="A Rofi plugin for selecting emojis"
arch=('x86_64')
url="https://github.com/Mange/rofi-emoji"
license=('BSD')
depends=('rofi' 'xsel')

source=("https://github.com/Mange/rofi-emoji/archive/v${pkgver}.tar.gz")
sha256sums=('d12d36de61d549c5f522a7046e95ca1f2b5fa9352c4b2333c01cae9ed296bb55')

build() {
  cd "$pkgname-$pkgver"

  autoreconf -i
  mkdir -p build
  cd build

  ../configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}
