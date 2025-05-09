# Maintainer: may <may@may.com>
pkgname=lscreensaver
pkgver=0.1
pkgrel=1
pkgdesc="Minimal X11/Wayland screensaver daemon using libinput & SDL2"
arch=('x86_64')
url="https://github.com/maygay/lscreensaver"
license=('MIT')
depends=('libinput' 'sdl2')
makedepends=('pkg-config')
source=('main.c')
sha256sums=('SKIP')  # for a single local source file

build() {
  gcc main.c -o lscreensaver \
    $(pkg-config --cflags --libs libudev libinput sdl2) -D_GNU_SOURCE
}

package() {
  install -Dm755 lscreensaver "$pkgdir"/usr/bin/lscreensaver
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  echo "MIT License (see source)" > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}