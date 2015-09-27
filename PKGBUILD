# Maintainer: Raphael Scholer <rascholer@gmail.com>
_pkgname=pep8-naming
pkgname="python-${_pkgname}"
pkgver=0.3.3
pkgrel=2
pkgdesc="This module provides a name plugin for flake8, the Python code checker."
arch=('any')
url="https://github.com/flintwork/${_pkgname}"
conflicts=("${pkgname}")
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
md5sums=('5f2fdf9aed3e417f5289f0deb1c1bbef')

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1

    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 755 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
