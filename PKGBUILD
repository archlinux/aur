# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-keyboard-git
pkgver=2.3.0.r18.g92c69e8
pkgrel=1
pkgdesc='Keyboard indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-keyboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libxml2'
         'libwingpanel.so')
makedepends=('git' 'granite-git' 'meson' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-keyboard')
conflicts=('wingpanel-indicator-keyboard')
source=("git+https://github.com/elementary/wingpanel-indicator-keyboard.git")
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-keyboard

   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson wingpanel-indicator-keyboard build
  ninja -C build
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
