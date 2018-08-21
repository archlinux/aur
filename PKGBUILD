# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=cerbere
pkgver=0.2.4
pkgrel=1
pkgdesc='The Pantheon Watchdog'
arch=('x86_64')
url='https://launchpad.net/cerbere'
license=('GPL2')
groups=('pantheon')
depends=('dconf' 'glib2' 'libgee')
makedepends=('git' 'meson' 'vala')
source=("git+https://github.com/elementary/cerbere.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson cerbere build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
