# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-datetime-git
pkgver=2.1.9.r58.g84b004c
pkgrel=1
pkgdesc='Switchboard Date & Time Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-datetime'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-datetime')
conflicts=('switchboard-plug-datetime')
source=('git+https://github.com/elementary/switchboard-plug-datetime.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-datetime

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-datetime build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
