# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>

pkgname=rofi-emoji
pkgver=2.1.0
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
sha512sums=('f79109fe8333a3f517c2d67a4a85d83922b2f5a31909d91efcb01005f3b721fa086fc66d51435220c2f54f69a843c3f5cae6348646c1f927ed354de54854e754')

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
