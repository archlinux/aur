# Maintainer: Raphael Scholer <rascholer@gmail.com>
_pkgname=pep8-naming
pkgname="python-${_pkgname}"
pkgver=0.4.1
pkgrel=1
pkgdesc="This module provides a name plugin for flake8, the Python code checker."
arch=('any')
url="https://github.com/flintwork/${_pkgname}"
conflicts=("${pkgname}")
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
md5sums=('392bdb012310a621242c17365b9947c5')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"

    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
