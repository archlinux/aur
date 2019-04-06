# Maintainer: Jon Wiersma (archaur at jonw dot org)
pkgname='segyio'
pkgdesc='Library for easy interaction with SEG-Y formatted seismic data with bindings for Python and Matlab'
pkgver='1.8.3'
pkgrel='1'
arch=('x86_64')
url='https://github.com/equinor/segyio'
license=('lgpl')
depends=(
  'python>=2.7'
  'python-numpy>=1.10'
)
makedepends=(
  'cmake'
  'python-setuptools>=28'
  'python-setuptools-scm'
  'python-pytest'
)
optdepends=(
  'python-sphinx: to build the documentation'
)
source=("https://github.com/equinor/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

md5sums=('0a68792d1d7215b4f48ad735aa3d39fb')
