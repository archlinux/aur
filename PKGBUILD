# Maintainer: Thibault Saunier <tsaunier@gnome.org>

pkgname=dssim-c-git
pkgrel=1
pkgver=1.3.3.r13.g0219de1
pkgdesc=" DSSIM C implementation"
arch=('x86_64')
url="https://github.com/pornel/dssim/"
license=(AGPL)
depends=('libpng')
provides=('dssim')
makedepends=('git' 'ninja' 'meson')
source=('git+https://github.com/kornelski/dssim#branch=dssim1-c')
sha256sums=('SKIP')

build() {
  arch-meson dssim build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

pkgver() {
  cd dssim
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
