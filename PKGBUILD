# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=wwplot
pkgver=1.0.0
pkgrel=1
pkgdesc="Plotting Tool for Experimental Physics Classes"
arch=(any)
url="https://github.com/wwmm/wwplot"
license=('GPL3')
depends=(python pyside6 python-numpy python-scipy python-matplotlib qt6-base
        qt6-declarative qt6-tools)
makedepends=('meson')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/wwmm/wwplot/archive/v$pkgver.tar.gz")
sha256sums=('e2c04731dcd2c4c9ba37510504aef777adba0744ff7b3b8ddcf963dcc9bb6de8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Remove any potential residual build files
  rm -rf _build
  meson _build --prefix=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver/_build"
  env DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:
