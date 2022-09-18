# Maintainer: Paul Irofti <paul@irofti.net>
_name=openml
pkgname="python-$_name"
pkgver=0.12.2
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
sha256sums=('cefb4792ca12ee87ab3acc5e5afb4e9d205c398621e2424f2f5de1564cfee849')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
