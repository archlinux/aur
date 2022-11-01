# Maintainer: a821
pkgname=python-pynndescent
pkgver=0.5.8
pkgrel=1
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="https://github.com/lmcinnes/pynndescent"
license=('BSD')
depends=('python-joblib' 'python-numba' 'python-scikit-learn' 'python-scipy')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz")
sha256sums=('a7c552569bf604a101fd54bba1d27c12389e065945dee3a6777a518c63a46f2b')

check() {
  cd "pynndescent-$pkgver"
  pytest
}

package() {
  cd "$srcdir/pynndescent-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
