# Maintainer: Atom Long <atom.long@hotmail.com>

_pyname=click-aliases
pkgname=python-${_pyname}
pkgver=1.0.1
pkgrel=1
pkgdesc="Add (multiple) aliases to a click_ group or command."
arch=('any')
url="https://github.com/click-contrib/click-aliases"
license=("MIT")
makedepends=('python-setuptools')
depends=('python-click')
source=(${_pyname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5702e81a1af1bfbe18aecb69a0eabfba28639bff64d3c9c6af4a08163d1fc07a')

build() {
  cd ${_pyname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pyname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set et ts=2 sw=2:
