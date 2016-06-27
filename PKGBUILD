# Maintainer: Daniel Milde <daniel@milde.cz>
pkgname=python2-pylint-common
_pkgname=pylint-common
pkgver=0.2.5
pkgrel=1
pkgdesc="Pylint plugin for augmenting and improving error detection and analysis in the standard Python library"
arch=('any')
url="https://pypi.python.org/pypi/pylint-common"
license=('GPL2')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.io/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('821725a39702815c68558df3059cb176')

build() {
  cd "${_pkgname}-${pkgver}"

  python2 setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"

    python2 setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
