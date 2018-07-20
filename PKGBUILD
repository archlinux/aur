# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-network-git
pkgver=r463.b67512a
pkgrel=1
pkgdesc='Network indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-network'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libnm-glib' 'networkmanager'
         'nm-connection-editor'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-network')
conflicts=('wingpanel-indicator-network')
replaces=('wingpanel-indicator-nztwork-bzr')
source=('git+https://github.com/elementary/wingpanel-indicator-network.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-network

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson wingpanel-indicator-network build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
