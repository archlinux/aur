pkgname=python-opentsne
pkgver=0.6.0
pkgrel=1
pkgdesc="Extensible, parallel implementations of t-SNE"
url="https://opentsne.readthedocs.io/en/latest/"
arch=('x86_64')
license=('BSD')
depends=('fftw' 'python-scikit-learn' 'python-numba' 'python-pynndescent')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/o/openTSNE/openTSNE-${pkgver}.tar.gz")
sha256sums=('62571d0da9585bb764a1dfc6a6ed51e9afcfea48a1c92a72002bd663f07b7151')

build() {
  cd "${srcdir}/openTSNE-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/openTSNE-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
