# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python-awaitable
_pkgname=${pkgname//python-/}
pkgver=0.2.1
pkgrel=1
pkgdesc=" A decorator to asynchronously execute synchronous functions"
url="http://www.muflone.com/awaitable/"
arch=('any')
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8310b40b08664474654c2b0fcd7ee356f2a7736084073e1de5c06df6074b0d8c')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

