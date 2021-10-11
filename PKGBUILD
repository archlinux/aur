# Maintainer: Clément Démoulins <clement@archivel.fr>

pkgname=pamixer-git
_realname=pamixer
pkgver=20211011
pkgrel=1
pkgdesc="Pulseaudio command-line mixer like amixer"
arch=('i686' 'x86_64')
url="https://github.com/cdemoulins/pamixer"
license=('GPL3')
depends=('libpulse' 'boost-libs')
makedepends=('git' 'boost' 'meson')
conflicts=('pamixer')

source=(git+https://github.com/cdemoulins/pamixer.git)
md5sums=('SKIP')

build() {
  arch-meson ${_realname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
