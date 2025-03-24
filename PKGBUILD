# Maintainer: Paul Irofti <paul@irofti.net>
_name=openml
pkgname="python-$_name"
pkgver=0.15.1
pkgrel=1
pkgdesc="python interface for OpenML"
arch=('any')
url="https://openml.org/"
license=('BSD')
depends=('python' 'python-liac-arff' 'python-xmltodict' 'python-requests'
  'python-scikit-learn' 'python-dateutil' 'python-pandas' 'python-scipy'
  'python-numpy' 'python-minio' 'python-pyarrow')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('58ae3840b6ea736bb6c69bcbb30d587b817f64db070dc691adb9e09b99018816')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set sw=2 et:
