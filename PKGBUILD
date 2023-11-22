pkgname=python-mixmod
pkgver=2.1.9
pkgrel=1
pkgdesc="Classification with Mixture Modelling"
url="https://github.com/mixmod"
arch=(x86_64)
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/mixmod/mixmod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a4bf19e642386d1c8a36365b537a12636f883bcdeb3a72b698947430f676541')

build() {
  cd "${srcdir}"/mixmod-$pkgver/Pymixmod
  SRC_DIR=$PWD/../mixmodLib python setup.py build
}

package() {
  cd "${srcdir}"/mixmod-$pkgver/Pymixmod
  python setup.py install --root=${pkgdir} --optimize=1
}
