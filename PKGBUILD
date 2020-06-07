# Maintainer: Simon Wilper <sxw@chronowerks.de>
pkgname=xframe
pkgver=0.3.0
pkgrel=1
pkgdesc="C++ multi-dimensional labeled arrays and dataframe based on xtensor"
arch=('any')
url="https://github.com/xtensor-stack/xframe"
license=('BSD-3-Clause')
depends=('gcc' 'xtensor')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xtensor-stack/xframe/archive/${pkgver}.tar.gz")

build() {
	cd "${pkgname}-${pkgver}"
  [ ! -d build ] && mkdir build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
	cd "${pkgname}-${pkgver}/build"
  make install
}
sha512sums=('880fe8ca00bd189a197cc71e5f32539562db69433fdfa03db5f0db8211230db36eb96757a5ca3c667ae1d4edc96eae38393718e7a1e3f7c1827130cf21579b07')
