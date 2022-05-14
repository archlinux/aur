pkgname=python-pynndescent
pkgver=0.5.7
pkgrel=1
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="https://github.com/lmcinnes/pynndescent"
license=('BSD')
depends=('python-joblib' 'python-numba' 'python-scikit-learn' 'python-scipy')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz")
sha256sums=('ecb395255fa36a748b5870b4ba0300ea0f7da8b1964864b8edd62577a84dfd7d')

package() {
  cd "$srcdir/pynndescent-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
