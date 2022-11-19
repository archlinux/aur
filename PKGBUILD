# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python-awaitable
_pkgname=${pkgname//python-/}
pkgver=0.2.2
pkgrel=1
pkgdesc="A decorator to asynchronously execute synchronous functions"
url="http://www.muflone.com/awaitable/"
arch=('any')
license=('GPL3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c592965cc68f2e226c45d2d8fec7b20d94915a33b5e9aa7e43b0c2fa266b5fb0')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

