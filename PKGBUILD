# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-jsonrpcserver
_name=jsonrpcserver
pkgver=4.0.5
pkgrel=1
pkgdesc="Process JSON-RPC requests in Python."
arch=('any')
depends=('python' 'python-apply_defaults' 'python-jsonschema')
makedepends=('python-setuptools')
url="https://github.com/bcb/jsonrpcserver"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('240c517f49b0fdd3bfa428c9a7cc581126a0c43eca60d29762da124017d9d9f4')

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
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
