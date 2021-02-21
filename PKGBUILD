# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-sharing-git
pkgver=2.1.4.r48.g2a0eb27
pkgrel=1
pkgdesc='Switchboard Sharing Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-sharing'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-sharing')
conflicts=('switchboard-plug-sharing')
source=('git+https://github.com/elementary/switchboard-plug-sharing.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-sharing

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-sharing build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
