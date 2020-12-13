# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sqliteschema'
pkgname="python-${_pkgname}"
pkgver=1.0.5
pkgrel=1
pkgdesc='Dump table schema of a SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqliteschema'
_url_pypi='https://pypi.org/project/sqliteschema'
license=('MIT')
depends=('python' 'python-mbstrdecoder' 'python-tabledata' 'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('443addd7d8874d4f576d418884a569944098c83fd49b80b21561a7905aaf38da')

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
