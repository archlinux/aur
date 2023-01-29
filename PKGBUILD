# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.6.1
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wayland' 'wlroots>=0.16' 'wlroots<0.17' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('07a009305209d68ce8952805d7a680d57ba6d18becddac806ad1a7c74d645734e9daa0b60e58bcf89da955af842dc85bd5b3f5211ce0336d3286fc63493e0dfe')


build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
