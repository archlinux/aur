# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-network-git
pkgver=7.0.2.r3.gce7c1a62
pkgrel=2
pkgdesc='Network indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-network'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'networkmanager'
         'nm-connection-editor'
         'libgranite.so' 'libwingpanel.so')
makedepends=('git' 'granite-git' 'meson' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-network')
conflicts=('wingpanel-indicator-network')
source=('git+https://github.com/elementary/wingpanel-indicator-network.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-network

   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson wingpanel-indicator-network build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
