# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-locale-git
pkgver=2.5.3.r7.g6b088dd
pkgrel=1
pkgdesc='Switchboard Locale Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-locale'
license=('GPL3')
depends=('accountsservice' 'glib2' 'glibc' 'gnome-desktop' 'gtk3' 'ibus'
         'libgee' 'polkit'
         'libswitchboard-2.0.so' 'libgranite.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-locale')
conflicts=('switchboard-plug-locale')
source=('git+https://github.com/elementary/switchboard-plug-locale.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-locale

 git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-locale build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
