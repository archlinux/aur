# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-dparse
pkgver=0.5.1
pkgrel=2
pkgdesc="Parser for Python dependency files"
url="https://github.com/pyupio/dparse"
arch=('any')
license=('MIT')
depends=('python-packaging' 'python-toml' 'python-pyaml')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pipenv')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('71dd0a0763fbb3f9112996c75e5f8258c77f348dfc1b9c6097a89fa377173a95')

build() {
  cd "dparse-$pkgver"
  python setup.py build
}

check() {
  cd "dparse-$pkgver"
  python setup.py pytest
}

package() {
  cd "dparse-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
