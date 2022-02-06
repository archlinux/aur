# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_name=Py6S
pkgname=('python-py6s')
pkgver=1.9.1
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
sha256sums=('ea84ece11a3d38e9284b31556ce41378eb84481905d91b7d68e98e9e4819fde0')
_pypi='https://files.pythonhosted.org/packages'
_path='f5/54/0608301a8315be1df95dae8cb5d3e490f145d9b9cc6b0ddcd582e7a4d825'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_name-$pkgver/"
    python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
