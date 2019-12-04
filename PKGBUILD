# Maintainer: Oystein Sture <oysstu (at) gmail (dot) com>
# Contributor: 
pkgname=python-tensorflow-probability
pkgver=0.8.0
pkgrel=3
pkgdesc="Probabilistic reasoning and statistical analysis in TensorFlow"
url="https://github.com/tensorflow/probability"
arch=('any')
license=('APACHE')
depends=('python-tensorflow' 'python-numpy' 'python-six' 'python-decorator' 'python-cloudpickle' 'python-gast02')
makedepends=('python-setuptools')
source=("https://github.com/tensorflow/probability/archive/${pkgver}.tar.gz")
sha256sums=('f6049549f6d6b82962523a6bf61c40c1d0c7ac685f209c0084a6da81dd78181d')

build() {
  cd "${srcdir}"/probability-${pkgver}
  python setup.py build
}

package() {
  cd "${srcdir}"/probability-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
