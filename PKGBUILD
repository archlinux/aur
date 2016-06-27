# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=pylint-common
pkgname=python-pylint-common
pkgver=0.2.2
pkgrel=1
pkgdesc="Pylint plugin for augmenting and improving error detection and analysis in the standard Python library"
arch=('any')
url="https://github.com/landscapeio/pylint-common"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/landscapeio/pylint-common/archive/${pkgver}.tar.gz)
md5sums=('aaa0146cb8ca185849d6a111003c23e8')

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
