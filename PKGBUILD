# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-pylint-plugin-utils
_pypi_pkgname=pylint-plugin-utils
pkgver=0.6
pkgrel=3
pkgdesc="Utilities and helpers for writing Pylint plugins"
arch=('any')
url="https://github.com/landscapeio/pylint-plugin-utils"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools' 'python-pylint')
source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('57625dcca20140f43731311cd8fd879318bf45a8b0fd17020717a8781714a25a')

build() {
  cd "${_pypi_pkgname}-${pkgver}"
  python setup.py build
}

package() {
    cd "${_pypi_pkgname}-${pkgver}"
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
