# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-datetime-git
pkgver=2.2.5.r47.g89a2496
pkgrel=1
pkgdesc='Date & Time indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-datetime'
license=('GPL3')
groups=('pantheon-unstable')
depends=('evolution-data-server' 'glib2' 'glibc' 'gtk3' 'libgee' 'libical'
         'libgranite.so' 'libwingpanel.so' 'libhandy-1.so')
makedepends=('git' 'granite-git' 'meson' 'vala' 'wingpanel-git' 'libhandy')
provides=('wingpanel-indicator-datetime')
conflicts=('wingpanel-indicator-datetime')
source=('git+https://github.com/elementary/wingpanel-indicator-datetime.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-datetime

   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson wingpanel-indicator-datetime build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
