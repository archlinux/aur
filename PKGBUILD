# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-jsonrpcserver
_name=jsonrpcserver
pkgver=5.0.9
pkgrel=1
pkgdesc="Process JSON-RPC requests in Python."
arch=('any')
depends=('python' 'python-jsonschema' 'python-oslash')
makedepends=('python-setuptools' 'python-nose')
url="https://github.com/bcb/jsonrpcserver"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('a71fb2cfa18541c80935f60987f92755d94d74141248c7438847b96eee5c4482')

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
