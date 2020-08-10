# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-bluetooth-git
pkgver=2.1.5.r9.g94b430e
pkgrel=1
pkgdesc='Bluetooth indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-bluetooth'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bluez' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libwingpanel-2.0.so')
makedepends=('git' 'granite-git' 'intltool' 'meson' 'vala' 'wingpanel')
provides=('wingpanel-indicator-bluetooth')
conflicts=('wingpanel-indicator-bluetooth')
source=('git+https://github.com/elementary/wingpanel-indicator-bluetooth.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-bluetooth

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

  arch-meson wingpanel-indicator-bluetooth build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
