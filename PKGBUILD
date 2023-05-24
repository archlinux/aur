# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy-backend
pkgver=1.14.11
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings (backend)"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'python-wheel')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/46/d4/d0c61d448891aa37253c98acf5cde26abd4ac5851e108976aa58b97c5011/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2d329adce65b421a4e8a1af36116fb1756571349dc6b22a9ac3dde54b2a30af1')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

