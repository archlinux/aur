pkgname=python-pynndescent
pkgver=0.5.6
pkgrel=1
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="https://github.com/lmcinnes/pynndescent"
license=('BSD')
depends=('python-joblib' 'python-numba' 'python-scikit-learn' 'python-scipy')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz")
sha256sums=('61fb31885baac469d67933e2c7c935b6edebb06ee498e2f0f9dfc97c59d3725c')

package() {
  cd "$srcdir/pynndescent-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
