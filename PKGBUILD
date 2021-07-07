pkgname=python-pynndescent
pkgver=0.5.4
pkgrel=1
pkgdesc="Simple fast approximate nearest neighbor search"
arch=('any')
url="http://github.com/lmcinnes/pynndescent"
license=('BSD')
depends=('python-joblib' 'python-numba' 'python-scikit-learn' 'python-scipy')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/pynndescent/pynndescent-${pkgver}.tar.gz")
sha256sums=('221124cbad8e3cf3ed421a4089d80ac5a29d3215e76cb49effc1df887533d2a8')

package() {
  cd "$srcdir/pynndescent-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
