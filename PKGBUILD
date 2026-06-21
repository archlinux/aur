# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-pyfaidx
pkgver=0.9.0.4
pkgrel=1
pkgdesc="Efficient pythonic random access to fasta subsequences."
arch=("any")
url="https://pypi.python.org/pypi/pyfaidx"
license=("MIT")
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mdshw5/pyfaidx/archive/v$pkgver.tar.gz")
sha256sums=('f69214eb1b731fa2d0d92a88b0f14156309ff4db8742b078c1d9f45d8c3191dd')

build() {
    cd "$srcdir/pyfaidx-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pyfaidx-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
