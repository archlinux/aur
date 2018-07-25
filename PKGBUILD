# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-pylint-plugin-utils
_pypi_pkgname=pylint-plugin-utils
pkgver=0.4
pkgrel=1
pkgdesc="Utilities and helpers for writing Pylint plugins"
arch=('any')
url="https://github.com/landscapeio/pylint-plugin-utils"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/pylint-plugin-utils/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('8ad25a82bcce390d1d6b7c006c123e0cb18051839c9df7b8bdb7823c53fe676e')

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
