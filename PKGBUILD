# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-pyfaidx
pkgver=0.8.1.3
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
sha1sums=('f669b56108167d187d7c35f5e5c933eaf87d0300')

build() {
    cd "$srcdir/pyfaidx-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pyfaidx-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
