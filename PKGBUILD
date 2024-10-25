# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.8.1
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'libsfdo' 'pango' 'seatd' 'ttf-font' 'libwlroots-0.18.so' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('4a54f20ef07df7da8612ea911562a86fe619bf94a42eeb222ba72f667acc83c5847521d01500ac8ad33e34863d406d30fc403fce511c96bce6e98d595b3a26f4')


build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
