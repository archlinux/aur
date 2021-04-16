# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.2.1
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/johanmalm/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots' 'wayland' 'wayland-protocols' 'xorg-xwayland')
makedepends=('meson' 'scdoc')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/johanmalm/labwc/archive/${pkgver}.tar.gz")
b2sums=('3b687025b44d1fb6081230db6745b0b367721afcd88db9acd343f7436adcea9d989102071855f87f5d45f4369225fa6c47a89c4d31cfe55b6048ec6b1b20addf')


build() {
  cd "$pkgname-$pkgver"
  arch-meson -Dman-pages=enabled ../build
  ninja -v -C ../build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" meson install -C ../build
}
