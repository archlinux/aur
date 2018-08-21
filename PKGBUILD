# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-datetime-git
pkgver=r361.164dfaf
pkgrel=1
pkgdesc='Date & Time indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-datetime'
license=('GPL3')
groups=('pantheon-unstable')
depends=('evolution-data-server' 'glib2' 'glibc' 'gtk3' 'libgee' 'libical'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-datetime')
conflicts=('wingpanel-indicator-datetime')
source=('git+https://github.com/elementary/wingpanel-indicator-datetime.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-datetime

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson wingpanel-indicator-datetime build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
