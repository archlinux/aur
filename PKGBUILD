# Maintainer:  <_@_._>

pkgname=python-pyemf3
_pkgname=pyemf3
pkgver=3.1
pkgrel=1
pkgdesc="Pure Python Enhanced Metafile Library"
arch=('any')
license=('LGPL2.1')
url="https://github.com/jeremysanders/pyemf3"
depends=('python')
makedepends=('python-setuptools')
#checkdepends=('python-pytest' 'python-freezegun' 'python-hypothesis')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jeremysanders/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('87b953d401ff7e93e4182f40c55100ad0495b13061a7c0615bb4eb233d2a4bcc')

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
