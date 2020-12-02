# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='sqliteschema'
pkgname="python-${_pkgname}"
pkgver=1.0.3
pkgrel=2
pkgdesc='Dump table schema of a SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqliteschema'
_url_pypi='https://pypi.org/project/sqliteschema'
license=('MIT')
depends=('python' 'python-mbstrdecoder' 'python-tabledata' 'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('def3b61c8d1d6cd08238072e1251e94aea243da661c731a46dbc8b64857a4878')

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
