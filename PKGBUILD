# Maintainer: Paul Irofti <paul@irofti.net>
_name=openml
pkgname="python-$_name"
pkgver=0.13.1
pkgrel=1
pkgdesc="python interface for OpenML"
arch=('any')
url="http://openml.org/"
license=('BSD')
depends=('python' 'python-liac-arff' 'python-xmltodict' 'python-requests'
  'python-scikit-learn' 'python-dateutil' 'python-pandas' 'python-scipy'
  'python-numpy' 'python-minio' 'python-pyarrow')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('38ce7c32c28293cb1446d22e96e95e0352f7c62a5d88fe58ffdcad0e8c7a945b')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
