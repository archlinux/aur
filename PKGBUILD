_name=pyod
pkgname="python-$_name"
pkgver=2.0.5
pkgrel=1
arch=('any')
pkgdesc="A Python 3 Library Outlier Detection or Anomaly Detection"
url="https://github.com/yzhao062/pyod"
license=('GPL3')
source=("https://github.com/yzhao062/pyod/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f6c181bf3ad6d7af00b0d207c0ae847c099d983dc00d96db4af1f0231d50b92d3dde2f0e7b2cd9f3b727c6b9105fbf52bc052d7fe74407f5bbbe31715a9b1892')
depends=(
  'python'
  'python-joblib'
  'python-numba'
  'python-numpy'
  'python-packaging'
  'python-scikit-learn'
  'python-scipy'
)
makedepends=('python-setuptools')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
