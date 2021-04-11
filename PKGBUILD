pkgname=python-opentsne
pkgver=0.5.2
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn' 'python-numba' 'python-pynndescent')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/o/openTSNE/openTSNE-${pkgver}.tar.gz")
sha256sums=('eef60d1d4a5a9454d7366125cbfc664106efd38af07f390644102aac0738c763')

build() {
  cd "${srcdir}/openTSNE-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/openTSNE-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
