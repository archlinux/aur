# Maintainer: Grey Christoforo <first name at last name dot net>
_pkgname=pep8-naming
pkgname=python-pep8-naming
pkgver=0.7.0
pkgrel=1
pkgdesc="This module provides a name plugin for flake8, the Python code checker"
arch=('any')
url="https://github.com/PyCQA/pep8-naming"
license=('MIT')
depends=('python')
provides=('flake-pep8-naming')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
md5sums=('3f995030cf95cb3a548334d6b9b55033')

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
