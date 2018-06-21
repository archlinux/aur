# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-locale-git
pkgver=r320.84b55a8
pkgrel=1
pkgdesc='Switchboard Locale Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-locale'
license=('GPL3')
depends=('accountsservice' 'glib2' 'glibc' 'gnome-desktop' 'gtk3' 'ibus'
         'libgee' 'polkit'
         'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-locale')
conflicts=('switchboard-plug-locale')
source=('git+https://github.com/elementary/switchboard-plug-locale.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-locale

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson switchboard-plug-locale build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
