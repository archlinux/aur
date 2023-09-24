# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.6.5
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'wlroots>=0.16' 'wlroots<0.17' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('04534bb328f6635f50829e137e8f06b3f6c43ff076c810f76b7a4c8b39b67684cdd3d744ec1c38010467c204fe912544e8c7fbc6b49ef920b0aaf0858707c266')


build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
