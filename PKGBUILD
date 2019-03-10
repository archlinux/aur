# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-srsly
pkgver=0.0.5
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
source=("https://files.pythonhosted.org/packages/05/df/6ad3ad1d2747b0ef17e674c8cf7f0cb5e5c0056ee6e9b2ebc88e55871cd4/srsly-0.0.5.tar.gz")
sha256sums=('977aa6e5fd3f7e9d1c8fe7aeed841dfe3ede75dfce04255d4c670e663faaef2a')

build(){
    cd "srsly-${pkgver}"
    python setup.py build
}

package(){
    cd "srsly-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
