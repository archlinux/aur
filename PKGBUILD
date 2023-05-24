# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy
pkgver=3.0.0
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'cppyy-backend' 'cpycppyy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/3a/d6/c6d33d3b31e035c1bd9383fb5a01831968a52106257d8baf76235b992894/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9c7c1c113d771488cee0bf63f26d2bbf4f42de731eb63776e007cb0d9e23d3d8')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

