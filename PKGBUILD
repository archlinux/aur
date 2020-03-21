pkgname=python-opentsne
pkgver=0.3.12
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn' 'python-numba' 'python-pynndescent')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/o/openTSNE/openTSNE-${pkgver}.tar.gz")
sha256sums=('35538017e7479c96aa3da7841fea22d7353762fecb1cec98b7431922db7861dc')


build() {
  cd "${srcdir}/openTSNE-$pkgver"
  python setup.py build
}

package() {
  depends=('fftw' 'python-scikit-learn' 'python-numba')

  cd "${srcdir}/openTSNE-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
