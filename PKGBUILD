# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-notifications-git
pkgver=2.1.4.r123.geb94a77
pkgrel=1
pkgdesc='Notifications indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-notifications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libwnck3'
         'libgranite.so' 'libwingpanel.so' 'libhandy-1.so')
makedepends=('git' 'granite-git' 'meson' 'vala' 'wingpanel-git' 'libhandy')
provides=('wingpanel-indicator-notifications')
conflicts=('wingpanel-indicator-notifications')
source=('git+https://github.com/elementary/wingpanel-indicator-notifications.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-notifications

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson wingpanel-indicator-notifications build
  ninja -C build
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
