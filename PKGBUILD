# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-srsly
pkgver=2.0.0
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
source=("https://files.pythonhosted.org/packages/46/2f/8938af85873f1249a771788a82acbb8b684c444ba1a17d769ac28aeac55f/srsly-2.0.0.tar.gz")
sha256sums=('785b00e00406120dbef4ca82925051e6b60fe870c5f84f0d22b3632d574eb870')

build(){
    cd "srsly-${pkgver}"
    python setup.py build
}

package(){
    cd "srsly-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
