# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-sound-git
pkgver=2.1.8.r12.g845e631
pkgrel=1
pkgdesc='Sound indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-sound'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'gtk3' 'libcanberra'
         'libgee' 'libnotify' 'libpulse'
         'libgranite.so' 'libwingpanel.so')
makedepends=('git' 'gobject-introspection' 'granite-git' 'gtk2' 'meson' 'vala'
             'wingpanel-git')
provides=('wingpanel-indicator-sound')
conflicts=('wingpanel-indicator-sound')
source=('git+https://github.com/elementary/wingpanel-indicator-sound.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-sound

   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson wingpanel-indicator-sound build
  ninja -C build
}

package() {

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
