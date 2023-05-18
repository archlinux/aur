# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-pylint-plugin-utils
_pypi_pkgname=pylint-plugin-utils
pkgver=0.8
pkgrel=0
pkgdesc="Utilities and helpers for writing Pylint plugins"
arch=('any')
url="https://github.com/landscapeio/pylint-plugin-utils"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools' 'python-pylint')
#source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
source=("https://github.com/PyCQA/${_pypi_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f16f35d96534919df9e019b15fb10206585492a6daae24cd9daed9439903cb79')

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
