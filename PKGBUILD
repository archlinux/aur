# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python-awaitable
_pkgname=${pkgname//python-/}
pkgver=0.2.3
pkgrel=1
pkgdesc="A decorator to asynchronously execute synchronous functions"
url="http://www.muflone.com/awaitable/"
arch=('any')
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2d014262e9590b6586d878e09b93902805d86b4ee094c70eb9f12d67db1274d8')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

