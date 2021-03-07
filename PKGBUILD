# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.1.0
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/johanmalm/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots' 'wayland' 'wayland-protocols' 'xorg-xwayland')
makedepends=('meson' 'scdoc')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/johanmalm/labwc/archive/0.1.0.tar.gz")
b2sums=('336b2949e2306f9dcbe4786c0b28e70cef0b9d999276d88890e25933297ba433ce297dc0c0e0376c1267bc0d3ff3a7b798db32d04c6f297d2803f5167f8cf503')


build() {
  cd "$pkgname-$pkgver"
  arch-meson -Dman-pages=enabled ../build
  ninja -v -C ../build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" meson install -C ../build
}
