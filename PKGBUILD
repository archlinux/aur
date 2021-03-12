# Maintainer: Paul Irofti <paul@irofti.net>
_name=openml
pkgname="python-$_name"
pkgver=0.11.0
pkgrel=1
pkgdesc="python interface for OpenML"
arch=('any')
url="http://openml.org/"
license=('BSD')
depends=('python' 'python-liac-arff' 'python-xmltodict' 'python-requests'
  'python-scikit-learn' 'python-dateutil' 'python-pandas' 'python-scipy'
  'python-numpy' 'python-minio' 'python-pyarrow')
makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/g/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/a4/5d/30ce4d1af609ba389d55654e6a7271619253dbbe7006a33bb20c703f0234/${_name}-${pkgver}.tar.gz")
sha256sums=('935a457e7a3fd07412a873621bd710f80277e94a8f396207d8fcd3e66f2795c8')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
