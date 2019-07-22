# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>

pkgname=rofi-emoji
pkgver=2.0.0
pkgrel=1
pkgdesc="A Rofi plugin for selecting emojis"
arch=('x86_64')
url="https://github.com/Mange/rofi-emoji"
license=('BSD')
depends=('rofi')
optdepends=('xsel: X11 support'
            'xclip: X11 support'
            'wl-clipboard: Wayland support')

source=("https://github.com/Mange/rofi-emoji/archive/v${pkgver}.tar.gz")
sha256sums=('99b7c284264572c42f60d572a82ff5c07efd7191a562b5de5c32330ee5cd1af0')

build() {
  cd "$pkgname-$pkgver"

  autoreconf -i
  mkdir -p build
  cd build

  ../configure
  make
}

package() {
  cd "$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}
