# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-srsly
pkgver=0.0.7
pkgrel=1
pkgdesc="Modern high-performance serialization utilities for Python"
url="https://pypi.org/project/srsly/"
depends=(cython
         python-pytest
         python-pytest-timeout
         python-pytz
         python-mock
         python-numpy)
makedepends=(python-setuptools)
license=(MIT)
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("https://files.pythonhosted.org/packages/84/59/6f276ab6d74888eed0e999d617101ed7357fc1ee073e9aac92d53260bd23/srsly-0.0.7.tar.gz")
sha256sums=('f3a2948b088064f719918ef46a1f14ffbd3ccab4c639c4ecb65053814fb036ed')

build(){
    cd "srsly-${pkgver}"
    python setup.py build
}

package(){
    cd "srsly-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
