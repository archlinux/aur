# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pyvcd
pkgname=python-$_pkgname
pkgver=0.2.4
pkgrel=1
pkgdesc='Python package for writing Value Change Dump (VCD) files'
arch=('any')
url='https://github.com/SanDisk-Open-Source/pyvcd'
license=('MIT')
makedepends=('python-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c5587841b36c6748f3d929d3584455dfbd4387d63d7c6bf414bff0e7123c8c84cae8135c45f673a88f981fe0f06b46bc054c3e00033ae63d308ac2944a47b2dd')

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
