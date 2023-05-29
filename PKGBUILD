# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy-backend
pkgver=1.14.11
pkgrel=2
pkgdesc="Cling-based Python-C++ bindings (backend)"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2d329adce65b421a4e8a1af36116fb1756571349dc6b22a9ac3dde54b2a30af1')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
