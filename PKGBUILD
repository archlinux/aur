pkgname=python-chaospy
pkgver=2.3.3
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-networkx' 'python-scikit-learn')
source=("https://github.com/jonathf/chaospy/archive/v${pkgver}.tar.gz")
sha256sums=('0fc918583053f3573edbb95885b568d097f60b279b0754e91f5f4dbf927ac338')

build() {
  cd "${srcdir}/chaospy-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/chaospy-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

