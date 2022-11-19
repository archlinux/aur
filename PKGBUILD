# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python-awaitable-git
_pkgname=awaitable
pkgver=0.2.3
pkgrel=1
pkgdesc="A decorator to asynchronously execute synchronous functions"
url="http://www.muflone.com/awaitable/"
arch=('any')
license=('GPL3')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python')
conflicts=('python-awaitable')
source=("git+https://github.com/muflone/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

