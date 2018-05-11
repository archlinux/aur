# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>

pkgname=rofi-emoji
pkgver=0.1.0
pkgrel=1
pkgdesc="A Rofi plugin for selecting emojis"
arch=('x86_64')
url="https://github.com/Mange/rofi-emoji"
license=('BSD')
depends=('rofi' 'xsel')

source=("https://github.com/Mange/rofi-emoji/archive/v${pkgver}.tar.gz")
sha256sums=('2d23c70ba684895f80887ec71a018d58860a4647ea55060f3be0489aace0b188')

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
