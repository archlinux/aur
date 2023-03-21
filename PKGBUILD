# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.6.2
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wayland' 'wlroots>=0.16' 'wlroots<0.17' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('faaacae252a82fa4ff37f1c63fea94ccdec4b590dde49b1f72170238682649381b7184f9c3ec6c5ed1fb46cbd7f44d7208a226b3e03b99b2c998d7f12b710232')


build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
