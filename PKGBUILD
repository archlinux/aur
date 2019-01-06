# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-power
pkgver=2.1.3
pkgrel=1
pkgdesc='Wingpanel Power Indicator'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-power'
license=('GPL3')
groups=('pantheon')
depends=('bamf' 'glib2' 'gtk3' 'libgee' 'libgtop'
         'libgranite.so' 'libudev.so' 'libwingpanel-2.0.so')
makedepends=('git' 'intltool' 'meson' 'vala' 'wingpanel')
source=("git+https://github.com/elementary/wingpanel-indicator-power.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson wingpanel-indicator-power build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
