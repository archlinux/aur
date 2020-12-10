# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-parental-controls-git
pkgver=3.0.1.r38.gff4f66e
pkgrel=1
pkgdesc='Switchboard Parental Controls Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-parental-controls'
license=('GPL3')
groups=('pantheon-unstable')
depends=('accountsservice' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'polkit' 'libhandy'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-parental-controls')
conflicts=('switchboard-plug-parental-controls')
source=('git+https://github.com/elementary/switchboard-plug-parental-controls.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-parental-controls

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-parental-controls build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
