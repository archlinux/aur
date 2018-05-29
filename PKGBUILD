# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-geoclue2-agent-git
pkgver=r103.1effca6
pkgrel=1
pkgdesc='Pantheon Geoclue2 Agent'
arch=('x86_64')
url='https://github.com/elementary/pantheon-agent-geoclue2'
license=('GPL3')
groups=('pantheon-unstable')
depends=('dbus-glib' 'glib2' 'glibc' 'gtk3' 'geoclue2')
makedepends=('git' 'intltool' 'meson' 'vala')
provides=('pantheon-geoclue2-agent')
conflicts=('pantheon-geoclue2-agent')
source=('pantheon-geoclue2-agent::git+https://github.com/elementary/pantheon-agent-geoclue2.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-geoclue2-agent

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson pantheon-geoclue2-agent build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
