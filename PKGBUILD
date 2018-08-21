# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-printers
pkgver=0.1.3
pkgrel=1
pkgdesc='Printers plug for Switchboard'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-printers'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'gtk3' 'libcups' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'meson' 'vala')
source=("git+https://github.com/elementary/switchboard-plug-printers.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson switchboard-plug-printers build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
