# Maintainer: Wellington <wellingtonwallace@gmail.com>
pkgname=wwplot
pkgver=1.0.1
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
sha256sums=('913d264798bd5b807bcb5e385d0a1a91b78e26a476bcd089164045ca4f2cba2e')

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
