# Maintainer: Oystein Sture <oysstu (at) gmail (dot) com>
# Contributor: 
pkgname=python-tensorflow-probability
pkgver=0.7.0
pkgrel=1
pkgdesc="Probabilistic reasoning and statistical analysis in TensorFlow"
url="https://github.com/tensorflow/probability"
arch=('any')
license=('APACHE')
depends=('python-tensorflow' 'python-numpy' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/tensorflow/probability/archive/v${pkgver::-2}.tar.gz")
sha256sums=('aa938dfb84e68e1f645a5543ed2e7eeb2bdc260f751e5a4e8434b25062b7a25f')

build() {
  cd "${srcdir}"/probability-${pkgver::-2}
  python setup.py build
}

package() {
  cd "${srcdir}"/probability-${pkgver::-2}
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
