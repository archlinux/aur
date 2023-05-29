# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

_realname="CPyCppyy"
pkgname="cpycppyy"
pkgver=1.12.13
pkgrel=2
pkgdesc="Cling-based Python-C++ bindings for CPython"
arch=('any')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LBNL BSD')
depends=('python' 'cppyy-cling' 'cppyy-backend')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_realname::1}/${_realname}/${_realname}-${pkgver}.tar.gz")
sha256sums=('f8c8c05b1eb8f0ccaed07b5069efabecff791bbe5e1b5be86767d32974e833d4')

build() {
  cd "$_realname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_realname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
