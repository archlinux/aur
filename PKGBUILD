# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-srsly
pkgver=2.3.2
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
source=("https://files.pythonhosted.org/packages/b0/6e/3e4e3126088e9a372d3c903045520fe1c8e0b727ecb0a36b58d86fe0ea67/srsly-2.3.2.tar.gz")
sha256sums=('f78eaef8d982e98921ce026d4205e652a9333137259f0b621f5c7b579e746e9d')

build() {
    cd "srsly-${pkgver}"
    python setup.py build
}

package() {
    cd "srsly-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
