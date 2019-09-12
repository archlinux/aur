# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-jsonrpcclient
_name=jsonrpcclient
pkgver=3.3.4
pkgrel=2
pkgdesc="Send JSON-RPC requests in Python."
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-nose')
url="https://github.com/bcb/jsonrpcclient"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('c50860409b73af9f94b648439caae3b4af80d5ac937f2a8ac7783de3d1050ba9')

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
