# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-jsonrpcserver
_name=jsonrpcserver
pkgver=5.0.6
pkgrel=1
pkgdesc="Process JSON-RPC requests in Python."
arch=('any')
depends=('python' 'python-jsonschema' 'python-oslash')
makedepends=('python-setuptools' 'python-nose')
url="https://github.com/bcb/jsonrpcserver"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('0fdd69c15e67004fb064d2254469cf82d02b7bc8a7bf7760055caa9d62d92f7c')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

check(){
    cd "$srcdir/$_name-$pkgver"

    # For nosetests
    nosetests
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
