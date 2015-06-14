# Maintainer: Zdeněk Janeček <jan.zdenek@gmail.com>
pkgname=shogun
pkgver=4.0.0
pkgrel=1
pkgdesc="Shogun - A Large Scale Machine Learning Toolbox with the python interface"
arch=('i686' 'x86_64')
url="http://www.shogun-toolbox.org"
license=('GPLv3')
depends=('cblas' 'lapack' 'swig' 'python-numpy' 'libcl')
source=(http://shogun-toolbox.org/archives/shogun/releases/4.0/sources/$pkgname-$pkgver.tar.bz2)
md5sums=('57370e869f3b24f74ce9c7b8741000b0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DPythonModular=ON ..
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
