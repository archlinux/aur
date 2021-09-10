# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_pyname=pytest-cram
pkgname=python-$_pyname
pkgver=0.2.2
pkgrel=1
pkgdesc='Run cram tests with pytest'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python-cram' 'python-pytest' 'python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")

sha256sums=('00e358dff2836239cab47d846656d3029035a5ebb60c0cb188d16c9d6bf50510')

build() {
  cd $_pyname-$pkgver
  python setup.py build
}

package() {
  cd $_pyname-$pkgver
  install -D -m644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

