# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-srsly
pkgver=2.3.1
pkgrel=1
pkgdesc="Modern high-performance serialization utilities for Python"
arch=(i686 x86_64 armv7 aarch64)
url="https://pypi.org/project/srsly/"
license=(MIT)
depends=(cython
         python-pytest
         python-pytest-timeout
         python-pytz
         python-mock
         python-numpy)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/a3/2d/c9a532776c2b08a2ffcae922d7c9d6e355a8381b00599aa677720b7763cd/srsly-2.3.1.tar.gz")
sha256sums=('3dcce93c69ff18e8a8d7decfdfdf8e1fd44c4446cdee8d0e5d545d6b172dc377')

build() {
    cd "srsly-${pkgver}"
    python setup.py build
}

package() {
    cd "srsly-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
