# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-a11y-git
pkgver=r109.f3424ea
pkgrel=1
pkgdesc='Universal Access indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-a11y'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel.so')
makedepends=('meson' 'git' 'granite-git' 'vala' 'wingpanel-git')
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
