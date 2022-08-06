# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-pyfnutils
pkgver=1.3
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
sha1sums=('055825e6dbeebde50e955535c22a7af973ea4d41')

build() {
    cd "$srcdir/pyfnutils-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pyfnutils-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
