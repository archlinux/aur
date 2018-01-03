# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=wwplot
pkgver=0.0.2
pkgrel=1
pkgdesc="Plotting Tool for Experimental Physics Classes"
arch=(any)
url="https://github.com/wwmm/wwplot"
license=('GPL3')
depends=(python python-gobject python-cairocffi gtk3 python-numpy python-scipy
        python-matplotlib)
makedepends=('meson')
options=(!emptydirs)
source=("$pkgname-$pkgver::https://github.com/wwmm/wwplot/archive/v$pkgver.tar.gz")
md5sums=('c1d3a9ef93fb03873db53678962c71ab')

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
