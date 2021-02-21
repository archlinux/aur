# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-a11y-git
pkgver=2.2.0.r52.gbd7505e
pkgrel=1
pkgdesc='Switchboard Universal Access Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-a11y'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-a11y')
conflicts=('switchboard-plug-a11y')
source=('git+https://github.com/elementary/switchboard-plug-a11y.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-a11y

   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-a11y build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
