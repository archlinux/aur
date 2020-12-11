# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-a11y-git
pkgver=r100.76c85a0
pkgrel=2
pkgdesc='Universal Access indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-a11y'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('meson' 'git' 'granite-git' 'vala' 'wingpanel')
provides=('wingpanel-indicator-a11y')
conflicts=('wingpanel-indicator-a11y')
replaces=('wingpanel-indicator-a11y-bzr')
source=('git+https://github.com/elementary/wingpanel-indicator-a11y.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-a11y

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson wingpanel-indicator-a11y build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
