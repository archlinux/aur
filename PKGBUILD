# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy-backend
pkgver=1.10.7
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings (backend)"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'python-wheel')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/15/53/b75a3df99aa2a93d32aa7be94672657af9afd80d56a55432baf4ab52cdd7/${pkgname}-${pkgver}.tar.gz")
sha256sums=('57e7773ce78ee2f22307c5f44f13d203af7b11d001dbe1a0b07f430da4e54b90')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

