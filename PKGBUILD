# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sqliteschema'
pkgname="python-${_pkgname}"
pkgver=1.0.4
pkgrel=1
pkgdesc='Dump table schema of a SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqliteschema'
_url_pypi='https://pypi.org/project/sqliteschema'
license=('MIT')
depends=('python' 'python-mbstrdecoder' 'python-tabledata' 'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8d0552b99f160d2210497eb76ccf17e8d008fe5191ed81a1e3053bb26121b9b8')

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
