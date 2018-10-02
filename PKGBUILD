# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-nightlight
pkgver=2.0.1
pkgrel=1
pkgdesc='Winganel Nightlight Indicator'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-nightlight'
license=('GPL2')
groups=('pantheon')
depends=('glib2' 'gtk3'
         'libwingpanel-2.0.so')
makedepends=('git' 'intltool' 'meson' 'vala' 'wingpanel-git')
source=("git+https://github.com/elementary/wingpanel-indicator-nightlight.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson wingpanel-indicator-nightlight build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
