# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=pylint-plugin-utils
pkgname=python-pylint-plugin-utils
pkgver=0.2.3
pkgrel=1
pkgdesc="Utilities and helpers for writing Pylint plugins"
arch=('any')
url="https://github.com/landscapeio/pylint-plugin-utils"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/landscapeio/pylint-plugin-utils/archive/${pkgver}.tar.gz)
md5sums=('c09c298cc2b5f1af0831edf7455228e7')

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
