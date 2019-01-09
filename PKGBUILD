pkgname=python-fasttsne
pkgver=0.2.13
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn' 'python-numba')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/f/fastTSNE/fastTSNE-${pkgver}.tar.gz")
sha256sums=('c602acf5e61f80bdda1bdfe91838ec89d7fdbdbb072e54c0d8da31c35fc964a0')

build() {
  cd "${srcdir}/fastTSNE-$pkgver"
  python setup.py build
}

package() {
  depends=('fftw' 'python-scikit-learn' 'python-numba')

  cd "${srcdir}/fastTSNE-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
  rm -rf usr/lib/python*/site-packages/{benchmarks,examples,tests}
}
