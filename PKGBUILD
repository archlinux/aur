# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-geoclue2-agent
pkgver=1.0.4
pkgrel=1
pkgdesc='Pantheon Geoclue2 Agent'
arch=(x86_64)
url=https://github.com/elementary/pantheon-agent-geoclue2
license=(GPL3)
groups=(pantheon)
depends=(
  geoclue2
  glibc
  libgdk-3.so
  libgio-2.0.so
  libglib-2.0.so
  libgobject-2.0.so
  libgtk-3.so
)
makedepends=(
  git
  intltool
  meson
  vala
)
source=(pantheon-geoclue2-agent::git+https://github.com/elementary/pantheon-agent-geoclue2.git#tag=46d69d8d985b2e2866d265c1013d2142b3a02241)
sha256sums=(SKIP)

pkgver() {
  cd pantheon-geoclue2-agent

  git describe --tags
}

build() {
  arch-meson pantheon-geoclue2-agent build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
