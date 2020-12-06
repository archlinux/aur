# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-power-git
pkgver=2.2.0.r28.g3bd02c7
pkgrel=1
pkgdesc='Power indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-power'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bamf' 'glib2' 'glibc' 'gtk3' 'libgee' 'libgtop'
         'libgranite.so' 'libudev.so' 'libwingpanel-3.0.so')
makedepends=('git' 'granite' 'meson' 'vala' 'wingpanel')
provides=('wingpanel-indicator-power')
conflicts=('wingpanel-indicator-power')
source=('git+https://github.com/elementary/wingpanel-indicator-power.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-power

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson wingpanel-indicator-power build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
