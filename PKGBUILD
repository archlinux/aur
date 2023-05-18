# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-pylint-plugin-utils
_pypi_pkgname=pylint_plugin_utils
pkgver=0.8.1
pkgrel=0
pkgdesc="Utilities and helpers for writing Pylint plugins"
arch=('any')
url="https://github.com/landscapeio/pylint-plugin-utils"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools' 'python-pylint')
source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('a595517d238d2ebe586fd867325cc656d4fac8d22b99421ff4cfb51b8c823a93')

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
