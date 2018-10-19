# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-calendar
pkgver=4.2.3
pkgrel=1
pkgdesc='The Pantheon Calendar'
arch=('x86_64')
url='https://github.com/elementary/calendar'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'clutter' 'clutter-gtk' 'contractor' 'evolution-data-server'
         'folks' 'gdk-pixbuf2' 'geocode-glib' 'glib2' 'gtk3' 'libchamplain'
         'libgee' 'libical' 'libnotify' 'libsoup'
         'libgranite.so')
makedepends=('git' 'intltool' 'meson' 'vala')
source=("pantheon-calendar::git+https://github.com/elementary/calendar.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson pantheon-calendar build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
