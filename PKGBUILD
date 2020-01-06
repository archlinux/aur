# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-jsonrpcserver
_name=jsonrpcserver
pkgver=4.1.0
pkgrel=1
pkgdesc="Process JSON-RPC requests in Python."
arch=('any')
depends=('python' 'python-apply_defaults' 'python-jsonschema')
makedepends=('python-setuptools' 'python-nose')
url="https://github.com/bcb/jsonrpcserver"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('3a35c0ef21174ca98f995f99688cebadda97053785833fbb31ec862d6b157f6d')

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
