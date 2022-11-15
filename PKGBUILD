# Maintainer:  <_@_._>

pkgname=python-pyemf3
_pkgname=pyemf3
pkgver=3.3
pkgrel=1
pkgdesc="Pure Python Enhanced Metafile Library"
arch=('any')
license=('LGPL2.1')
url="https://github.com/jeremysanders/pyemf3"
depends=('python')
makedepends=('python-setuptools')
#checkdepends=('python-pytest' 'python-freezegun' 'python-hypothesis')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeremysanders/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('59dde1609ac1bb586c6fccaf47183ba8cb46d9d7570d51f1cba19aada82a0cf4')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

#check() {
#  cd dateutil
#  pytest -W ignore::pytest.PytestUnknownMarkWarning # https://github.com/pytest-dev/pytest/issues/5678
#}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
