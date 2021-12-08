# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Frederic Bezies <fredbezies at gmail dot com>

pkgname=dtc-python2
pkgver=1.6.1
pkgrel=1
pkgdesc='Device Tree Compiler'
url='https://www.devicetree.org/'
arch=(x86_64)
license=(GPL2)
makedepends=(python2 swig)
source=(https://www.kernel.org/pub/software/utils/dtc/dtc-$pkgver.tar.xz)
b2sums=('c6fd93ede494923bcad1ac9aabe328f13333d70ccb52c048b085392cc5ebfe886c442bd95733a14044381b65a6eca130c57c473e6a5f8573e301dbe52cc4875d')

prepare() {
  sed -i 's/-Werror//' dtc-$pkgver/Makefile
}

build() {
  cd dtc-$pkgver
  make PYTHON=python2
}

package() {
  cd dtc-$pkgver
  DESTDIR="$pkgdir" make PYTHON=python2 SETUP_PREFIX="$pkgdir/usr" PREFIX="$pkgdir/usr" install
}
