# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname='python-dparse'
_name=${pkgname#python-}
pkgver=0.6.3
pkgrel=1
pkgdesc="Parser for Python dependency files"
arch=('any')
url="https://github.com/pyupio/dparse"
license=('MIT')
depends=(
  'python-packaging'
  'python-tomli'
)
makedepends=('python-setuptools')
optdepends=(
  'python-pipenv: pipenv'
  'python-pyyaml: conda'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('45696c4ebb3acdbbdf3b8b00e6d2ac720fb3851c160820f1f6fb6481baefb991')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
