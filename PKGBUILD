# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-privacy-git
pkgver=r90.3eaabf3
pkgrel=1
pkgdesc='Privacy indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-privacy'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bamf' 'glib2' 'glibc' 'gtk3' 'libgee' 'libgtop' 'lsof'
         'libwingpanel-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-privacy')
conflicts=('wingpanel-indicator-privacy')
source=('git+https://github.com/elementary/wingpanel-indicator-privacy.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-privacy

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson wingpanel-indicator-privacy build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
