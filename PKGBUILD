# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=cerbere-git
pkgver=r117.e44a9dd
pkgrel=1
pkgdesc='The Pantheon Watchdog'
arch=('x86_64')
url='https://github.com/elementary/cerbere'
license=('GPL2')
groups=('pantheon-unstable')
depends=('dconf' 'glib2' 'glibc' 'libgee')
makedepends=('git' 'meson' 'vala')
provides=('cerbere')
conflicts=('cerbere')
source=('git+https://github.com/elementary/cerbere.git')
sha256sums=('SKIP')

pkgver() {
  cd cerbere

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson cerbere build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
