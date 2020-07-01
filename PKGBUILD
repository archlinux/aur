# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-srsly
pkgver=2.2.0
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
source=("https://files.pythonhosted.org/packages/8b/fa/b12b47b714e6eb733d93c96ccb41bb6a742b38c0df101f534d8e0eb79b57/srsly-2.2.0.tar.gz")
sha256sums=('a4a8196590e2623d668ae49349dd7d33f31f5ae56ba8c1a9f4587301f73744c0')

build() {
    cd "srsly-${pkgver}"
    python setup.py build
}

package() {
    cd "srsly-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
