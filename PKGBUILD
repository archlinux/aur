# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=python-pycdlib
_name=pycdlib
pkgver=1.12.0
pkgrel=1
pkgdesc='Python library to read and write ISOs'
arch=('any')
url=https://github.com/clalancette/pycdlib
license=('LGPL2.1')
depends=('python')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ff49918e6c921981ce8791326466cb53265b6d96f86d0d3c5c9e5d43a77a97b33254fe4b27301f4e45d4699bfffaec5f4fb943b7650a85d08542c339d54f0a58')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
