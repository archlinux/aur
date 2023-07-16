# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.6.4
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wayland' 'wlroots>=0.16' 'wlroots<0.17' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('3defb0f9b7e8fb626aca488e057e705b0f06e48f67ab647554e4d9e3b3423e99c18a47fdde7b800672f92cfa34dbfd1448701cf5b22b1e2931967cfd048824e6')


build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
