# Maintainer: Oystein Sture <oysstu (at) gmail (dot) com>
# Contributor: 
pkgname=python-tensorflow-probability
pkgver=0.6.0
pkgrel=1
pkgdesc="Probabilistic reasoning and statistical analysis in TensorFlow"
url="https://github.com/tensorflow/probability"
arch=('any')
license=('APACHE')
depends=('python-tensorflow' 'python-numpy' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/tensorflow/probability/archive/v${pkgver}.tar.gz")
sha256sums=('48df4a932ceec90d1b6f91ee39aac9c94c675c2394bbfbbea2ce885767977cd1')

build() {
  cd "${srcdir}"/probability-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}"/probability-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
