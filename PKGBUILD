# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-display-git
pkgver=r214.0e44078
pkgrel=1
pkgdesc='Switchboard Display Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-display'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gnome-desktop' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'switchboard-git' 'meson' 'vala')
provides=('switchboard-plug-display')
conflicts=('switchboard-plug-display')
source=('git+https://github.com/elementary/switchboard-plug-display.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-display

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson switchboard-plug-display build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
