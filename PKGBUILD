pkgname=python-opentsne
pkgver=0.6.1
pkgrel=2
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn')
makedepends=('cython' 'python-setuptools')
optdepends=(
  'python-pynndescent: for nearest neighbor descent search'
  'python-hnswlib: for fast approximate nearest neightbors'
)
source=("https://pypi.io/packages/source/o/openTSNE/openTSNE-${pkgver}.tar.gz")
sha256sums=('79e7c84f485cc5bcdb03c172823968a055239ed9d2a8d8e7f7ba676e4d95b907')

build() {
  cd "${srcdir}/openTSNE-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/openTSNE-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
