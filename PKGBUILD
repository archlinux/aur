# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.8.0
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'ttf-font' 'libwlroots-0.18.so' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('7f7a96752505fdee76846fcf3bf1924627a8657ff45dbc8df1eb61b76a0eb08bd278bab2a6adbaaf09c92a93aa7c292613fcd31b356bdef39aa8662e48f966a6')


build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
