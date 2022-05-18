# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.5.2
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots>=0.15' 'wlroots<0.16' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('a839cb1e4b84a455c8cc0d411e3cb5d9960477568d062e847fcda7ef0f69f822e28bbdda088f2f6130d63d7c65bf8c623a0cb909d6eebb71fd91482c49e5154d')


build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
