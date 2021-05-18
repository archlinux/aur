# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>

pkgname=rofi-emoji
pkgver=2.2.0
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
sha512sums=('8fcf363ec8584395707d3230f30268fb6e5a7790d0bf4f7af48cc3026b1512f4a59fec6b87307c4588a23317c60d37f87bf9f58fce167536d43c5500c8780510')

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
