# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname=SimpleSQLite
pkgname=python-${_pkgname,,}
pkgver=1.1.2
pkgrel=1
pkgdesc='Simplify SQLite database operations'
arch=('any')
url='https://github.com/thombashi/SimpleSQLite'
license=('MIT')
depends=('python-dataproperty' 'python-mbstrdecoder' 'python-pathvalidate' 'python-sqliteschema' 'python-tabledata' 'python-typepy')
makedepends=('python-setuptools')
provides=("${_pkgname,,}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e8fe541efefb0c68601250ba609e40cc53430ac9afb2741c1eac084caf910b5f')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.rst' "${pkgdir}/usr/share/doc/${_pkgname,,}/README.rst"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname,,}/LICENSE"
}

# vim: ts=2 sw=2 et:
