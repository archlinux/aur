# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=python-pep8-naming
pkgver=0.11.1
pkgrel=1
pkgdesc="This module provides a name plugin for flake8, the Python code checker"
arch=(x86_64)
url="https://github.com/PyCQA/pep8-naming"
license=('MIT')
depends=('python')
provides=('flake-pep8-naming')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
md5sums=('946e1864f5ea39c6f4e35ed75fa7a0b4')

build() {
  cd "pep8-naming-${pkgver}"

  python setup.py build
}

package() {
    cd "pep8-naming-${pkgver}"

    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
