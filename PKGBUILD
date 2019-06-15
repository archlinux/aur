# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>

pkgname=rofi-emoji
pkgver=1.2.0
pkgrel=1
pkgdesc="A Rofi plugin for selecting emojis"
arch=('x86_64')
url="https://github.com/Mange/rofi-emoji"
license=('BSD')
depends=('rofi')
optdepends=('xsel: X11 support'
            'xclip: X11 support'
            'xdotool: X11 support'
            'wl-clipboard: Wayland support')

source=("https://github.com/Mange/rofi-emoji/archive/v${pkgver}.tar.gz")
sha256sums=('06df643356fb663d2373f77cb23fbd2f0421bf06eb91c2a103ca1d891abac490')

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
