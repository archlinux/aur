# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=wwplot
pkgver=0.0.4
pkgrel=1
pkgdesc="Plotting Tool for Experimental Physics Classes"
arch=(any)
url="https://github.com/wwmm/wwplot"
license=('GPL3')
depends=(python pyside2 python-numpy python-scipy python-matplotlib qt5-base
        qt5-declarative)
makedepends=('meson')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/wwmm/wwplot/archive/v$pkgver.tar.gz")
sha256sums=('ebfb8e45741699e956d1962259b90046c0e2e6f689fc9d092aa34d7dbd1c34c4')

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
