# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-geoclue2-agent
pkgver=1.0.5
pkgrel=2
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
_tag=930584360b7ef914b295fe5c5e4f2ac470ba6e68
source=(pantheon-geoclue2-agent::git+https://github.com/elementary/pantheon-agent-geoclue2.git#tag=${_tag})
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
