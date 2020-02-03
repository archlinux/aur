# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy
pkgver=1.6.1
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'cppyy-backend' 'cpycppyy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/08/11/297738d173f9e671337211f1d36b0c2de07f53176854b1c9843e389c22d2/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c5e98ef0e3ba33fc10b3e62b919939e37e7c1eeb83e892120ec6d8c3c0f88ea3')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

