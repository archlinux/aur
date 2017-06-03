# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-pylint-plugin-utils
_pypi_pkgname=pylint-plugin-utils
pkgver=0.2.6
pkgrel=1
pkgdesc="Utilities and helpers for writing Pylint plugins"
arch=('any')
url="https://github.com/landscapeio/pylint-plugin-utils"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/pylint-plugin-utils/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('85a2af1e5775351f300e044c24052ff7')

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
