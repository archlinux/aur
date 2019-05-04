# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-pylint-plugin-utils
_pypi_pkgname=pylint-plugin-utils
pkgver=0.5
pkgrel=1
pkgdesc="Utilities and helpers for writing Pylint plugins"
arch=('any')
url="https://github.com/landscapeio/pylint-plugin-utils"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/pylint-plugin-utils/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('8d9e31d5ea8b7b0003e1f0f136b44a5235896a32e47c5bc2ef1143e9f6ba0b74')

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
