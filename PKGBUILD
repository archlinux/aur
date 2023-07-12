# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_name=Py6S
pkgname=('python-py6s')
pkgver=1.9.2
pkgrel=1
pkgdesc="Python interface to the 6S Radiative Transfer Model"
arch=('any')
url='https://py6s.readthedocs.io/'
license=('LGPL')
makedepends=('python-setuptools')
depends=('6sv11' 'python-nose' 'python-numpy' 'python-scipy' 'python-dateutil')
optdepends=('python-matplotlib: only used for plotting spectra'
            'python-pysolar: only required for setting the geometry from a location and time'
            'python-pandas: only required for importing AERONET data')
options=(!emptydirs)
sha256sums=('2378ef027bbd3ead67cec47e9a14cf799b3bd851bc7833fbd44e2440666c0ff3')
_pypi='https://files.pythonhosted.org/packages'
_path='6e/47/d1931df56bb48f6982574f56b8589c0c43291ce06baa1118dbb979d1d57d'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_name-$pkgver/"
    python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
