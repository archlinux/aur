# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-jsonrpcserver
_name=jsonrpcserver
pkgver=4.1.2
pkgrel=1
pkgdesc="Process JSON-RPC requests in Python."
arch=('any')
depends=('python' 'python-apply_defaults' 'python-jsonschema')
makedepends=('python-setuptools' 'python-nose')
url="https://github.com/bcb/jsonrpcserver"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('73db55d1cf245ebdfb96ca05c4cce01c51b61be845a2a981f539ea1e6a4e0c4a')

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
