# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname='SimpleSQLite'
pkgname="python-${_pkgname,,}"
pkgver=1.1.3
pkgrel=2
pkgdesc='Simplify SQLite database operations'
arch=('any')
url='https://github.com/thombashi/SimpleSQLite'
_url_pypi='https://pypi.org/project/SimpleSQLite'
license=('MIT')
depends=('python'
        'python-dataproperty'
        'python-mbstrdecoder'
        'python-pathvalidate'
        'python-sqliteschema'
        'python-tabledata'
        'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e4f3613b04bc304a2f41294367c628ed00f27ca5d8eceb3f1a9d674f4b483b95')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
