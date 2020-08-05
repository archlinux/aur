# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=sqliteschema
pkgname=python-${_pkgname}
pkgver=1.0.3
pkgrel=1
pkgdesc='Dump table schema of a SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqliteschema'
license=('MIT')
depends=('python-mbstrdecoder' 'python-tabledata' 'python-typepy')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('def3b61c8d1d6cd08238072e1251e94aea243da661c731a46dbc8b64857a4878')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
