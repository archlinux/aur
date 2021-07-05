pkgname=python-pynndescent
pkgver=0.5.3
pkgrel=1
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="http://github.com/lmcinnes/pynndescent"
license=('BSD')
depends=('python-joblib' 'python-numba' 'python-scikit-learn' 'python-scipy')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz")
sha256sums=('1d5c4dfb560a1c866b2df5608b80773f58ecb6823432ef0e87909fda0e1333e9')

package() {
  cd "$srcdir/pynndescent-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
