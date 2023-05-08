# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.6.3
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wayland' 'wlroots>=0.16' 'wlroots<0.17' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('e753e27ec51f0c81026e78803e4790316dc11069381a0aea796ac87d951c86eba83518095c654f6eb5a6026b186f19658ac9359c1be0dfe645dc8fe55a9b0f83')


build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
