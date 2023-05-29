# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy
pkgver=3.0.0
pkgrel=2
pkgdesc="Cling-based Python-C++ bindings"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'cppyy-backend' 'cpycppyy')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9c7c1c113d771488cee0bf63f26d2bbf4f42de731eb63776e007cb0d9e23d3d8')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

