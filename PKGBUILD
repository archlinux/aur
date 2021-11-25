# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gtk-theme-elementary-git
pkgver=6.1.1.r4.g87bfed67
pkgrel=1
pkgdesc='elementary GTK theme'
arch=('any')
url='https://github.com/elementary/stylesheet'
license=('GPL3')
groups=('pantheon-unstable')
optdepends=('gtk-engine-murrine: GTK2 theme')
makedepends=('git' 'meson' 'sassc')
provides=('gtk-theme-elementary')
conflicts=('gtk-theme-elementary')
source=('gtk-theme-elementary::git+https://github.com/elementary/stylesheet.git')
sha256sums=('SKIP')

pkgver() {
  cd gtk-theme-elementary
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gtk-theme-elementary build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
