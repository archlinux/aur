# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://gitlab.gnome.org/gabmus/whatip

pkgname=glorious-man-pages-git
pkgver=cef6a2e
pkgrel=1
pkgdesc='Man pages for the computer peripherals from Glorious PC Gaming Race'
arch=('any')
url='https://gitlab.com/gabmus/glorious-man-pages'
license=('CC0')
depends=(
    'man-pages'
)
makedepends=('git' 'make' 'pandoc')
provides=('glorious-man-pages')
conflicts=('glorious-man-pages')
source=("gmp::git+https://gitlab.com/gabmus/glorious-man-pages")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gmp"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/gmp"
  make all
}

package() {
  cd "$srcdir/gmp"
  DESTDIR="$pkgdir" make install
}
