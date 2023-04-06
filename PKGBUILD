# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pyvcd
pkgname=python-$_pkgname
pkgver=0.3.0
pkgrel=3
pkgdesc='Python package for writing Value Change Dump (VCD) files'
arch=('any')
url='https://github.com/SanDisk-Open-Source/pyvcd'
license=('MIT')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('e6b1fc178a848fa9c8efed5184d09ab0cdf6d5d61ed717aecdbdec1998a0f15a1bcabd92a4191a006a4ee2dc0d4f62e10c82f3561eb3979da4e3a5b728998a6b')

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
