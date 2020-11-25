# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy
pkgver=1.9.1
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'cppyy-backend' 'cpycppyy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/eb/4c/945aff5d59ac1dd56eb5fb0c0444ce8b387a8159708d790af2fc08c34bfd/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1567dc470508a5d52590991b7038eb71c99671c4760ef94a8f424a5e565bfe79')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

