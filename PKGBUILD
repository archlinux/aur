# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=wwplot
pkgver=0.0.6
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
sha256sums=('2f271c4f33d74e3ebf6e9006122cb8d41b7e3cd1f827918ddcef4ae553a36df2')

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
