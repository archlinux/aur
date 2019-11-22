# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-srsly
pkgver=0.2.0
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
source=("https://files.pythonhosted.org/packages/1e/5b/f83e478fbf44c0d04f182e56db0871a53f5096febb8eb0be7cec75dca73b/srsly-0.2.0.tar.gz")
sha256sums=('aa02e2a62093ef09d7904343ee7381b9c9bab5b4f06960dfbeaa12035d0f0a3e')

build(){
    cd "srsly-${pkgver}"
    python setup.py build
}

package(){
    cd "srsly-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
