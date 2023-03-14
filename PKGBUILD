# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-pyfnutils
pkgver=1.4
pkgrel=1
pkgdesc="Small utility functions for Python: logging, parallel tasks, zstd."
arch=("any")
url="https://github.com/vejnar/pyfnutils"
license=("MPLv2")
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vejnar/pyfnutils/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('289010ce86ddef22fe81245bca1cb7755883ad03')

build() {
    cd "$srcdir/pyfnutils-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pyfnutils-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
