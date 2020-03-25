# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pyvcd
pkgname=python-$_pkgname
pkgver=0.1.7
pkgrel=1
pkgdesc='Python package for writing Value Change Dump (VCD) files'
arch=('any')
url='https://github.com/SanDisk-Open-Source/pyvcd'
license=('MIT')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9940647df4e3d18dca5a84b36a6262f7578f6b4d563d09dce841fde225b3351c8f48ca62ac44a64a4d73e8ccf2375f41697d890d008e377eeee1cc129618b958')

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
