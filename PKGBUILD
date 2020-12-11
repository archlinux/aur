# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-network-git
pkgver=2.2.4.r71.ga900f1a
pkgrel=1
pkgdesc='Network indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-network'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libnm-glib' 'networkmanager'
         'nm-connection-editor'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('git' 'granite' 'meson' 'vala' 'wingpanel')
provides=('wingpanel-indicator-network')
conflicts=('wingpanel-indicator-network')
replaces=('wingpanel-indicator-nztwork-bzr')
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
