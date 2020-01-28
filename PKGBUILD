# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-arff
_pypiname=${pkgname/python-/}
pkgver=0.9
pkgrel=1
pkgdesc="Python package for reading and writing Weka arff files"
arch=('any')
url="https://pypi.org/project/arff/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/50/de/62d4446c5a6e459052c2f2d9490c370ddb6abc0766547b4cef585913598d/${_pypiname}-${pkgver}.tar.gz")
sha256sums=('a4013e25a01a88a08e33aae60ec5c66deba0565709d056d2c20819d032fdd1eb')

build() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pypiname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

