# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-srsly
pkgver=2.0.1
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
source=("https://files.pythonhosted.org/packages/f4/0b/22c6caff32757e6c350dcaecf3a55f4df57e15c9a8eaa8c6db6f29b99b54/srsly-2.0.1.tar.gz")
sha256sums=('fa3c7375be8fe75f23c27feafbfb5f738d55ffdbf02964c6896fb7684f519a52')

build(){
    cd "srsly-${pkgver}"
    python setup.py build
}

package(){
    cd "srsly-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
