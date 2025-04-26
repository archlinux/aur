
# Maintainer:  Josh Ellithorpe <quest@mac.com>

pkgname=plank-reloaded-docklet-picky-git
pkgver=0.1.2
pkgrel=1
pkgdesc='Color Picker docklet for Plank Reloaded'
arch=('x86_64')
url='https://github.com/zquestz/picky'
license=('GPL3')
depends=('plank')
makedepends=('gnome-common' 'git' 'intltool' 'vala' 'meson' 'ninja')
source=('git+https://github.com/zquestz/picky.git')
sha256sums=('SKIP')

pkgver() {
  cd picky
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd picky
  meson setup --prefix=/usr build
}

build() {
  cd picky
  meson compile -C build
}

package() {
  cd picky
  meson install --destdir="${pkgdir}" -C build
}

# vim: ts=2 sw=2 et:
