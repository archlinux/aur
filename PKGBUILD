# Maintainer: Raphael Scholer <rascholer@gmail.com>
_pkgname=pep8-naming
pkgname="python-${_pkgname}-git"
pkgver=0.3.3.r0.gfe9bce0
pkgrel=1
pkgdesc="This module provides a name plugin for flake8, the Python code checker."
arch=('any')
conflicts=('python-${_pkgname}')
provides=('python-${_pkgname}')
url="https://github.com/flintwork/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("git+${url}")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${_pkgname}"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1

    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 755 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
# vim:set ts=2 sw=2 et:
