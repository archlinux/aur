# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>

pkgname=rofi-emoji
pkgver=2.1.1
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
sha512sums=('e34370e6ba7aa1e3c0eef9bfc49398fe77fcc64001eae44975673316bbed0ce9de991af3b0bfa17cd27af23666c1c599cbfa5de96452a180e591e820e329ddff')

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
