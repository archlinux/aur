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
             'python-setuptools-scm'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vejnar/pyfnutils/archive/v$pkgver.tar.gz")
sha256sums=('320bf31cab6d6197eacea5a20931b134890627534f418a9f8a1c1618344a6596')

build() {
    cd "$srcdir/pyfnutils-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pyfnutils-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
