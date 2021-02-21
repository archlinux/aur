# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-about-git
pkgver=2.6.3.r283.g875cb95
pkgrel=1
pkgdesc='Switchboard About Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-about'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so' 'libgtop' )
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-about')
conflicts=('switchboard-plug-about')
source=('git+https://github.com/elementary/switchboard-plug-about.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-about

   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-about build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
