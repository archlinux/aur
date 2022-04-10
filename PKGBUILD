# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.5.1
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots>=0.15' 'wlroots<0.16' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
b2sums=('58bb7263be3e3323676209393e9e99fde332fbd525bfa00eab10b9d0c69ffd9b949053743e59fc666f51c01b95b6ef628adad3a2f1c42bd8948a4c04dcdf1125')


build() {
  arch-meson -Dman-pages=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
