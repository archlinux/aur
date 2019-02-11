pkgname=python-chaospy
pkgver=3.0.3
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-networkx' 'python-scikit-learn')
source=("https://github.com/jonathf/chaospy/archive/v${pkgver}.tar.gz")
sha256sums=('e1d180b690eb89043175e7d98da4b2b50f01bd78585fe301d40a23006cd64202')

build() {
  cd "${srcdir}/chaospy-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/chaospy-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

