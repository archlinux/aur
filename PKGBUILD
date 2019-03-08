pkgname=python-opentsne
pkgver=0.3.0
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn' 'python-numba')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/o/openTSNE/openTSNE-${pkgver}.tar.gz")
sha256sums=('74352d62c3dd51b0c2f9f30ee6014ec20a5ac21b95d6a0776886a6c23335b3fb')


build() {
  cd "${srcdir}/openTSNE-$pkgver"
  python setup.py build
}

package() {
  depends=('fftw' 'python-scikit-learn' 'python-numba')

  cd "${srcdir}/openTSNE-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
