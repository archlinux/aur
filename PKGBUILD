# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pyvcd
pkgname=python-$_pkgname
pkgver=0.2.3
pkgrel=2
pkgdesc='Python package for writing Value Change Dump (VCD) files'
arch=('any')
url='https://github.com/SanDisk-Open-Source/pyvcd'
license=('MIT')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('0683f3c5d2e82af5b4f8b448cccf168fefa42b8f1f98fde238562d6c754d7d66366dfce83ea839056d56dd97fcb1559b8c9ce953efc5a65b13552f10aa58328f')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
