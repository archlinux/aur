# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-srsly
pkgver=2.3.0
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
source=("https://files.pythonhosted.org/packages/e6/fd/55347f5f58db5fdec748a2234d3d82978f051ac69b2371b9d8cb2a56e180/srsly-2.3.0.tar.gz")
sha256sums=('f994a266f6e547c8ffe803cb90baed7ca566831f924e0491402564ba0d185e66')

build() {
    cd "srsly-${pkgver}"
    python setup.py build
}

package() {
    cd "srsly-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
