# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.5.3
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots>=0.15' 'wlroots<0.16' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('c43c7b8f59b886436a6dce6c1e8383381ee6228d7207ec1caa84f49ddc8b0bcd772e22f18e05794a82b79f566ab54e7efb13be1d3d45c34ee81a44bf929a5304')


build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
