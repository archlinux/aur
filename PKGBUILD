# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=sqliteschema
pkgname=python-${_pkgname}
pkgver=1.0.2
pkgrel=1
pkgdesc='Dump table schema of a SQLite database file'
arch=('any')
url='https://github.com/thombashi/sqliteschema'
license=('MIT')
depends=('python-mbstrdecoder' 'python-tabledata' 'python-typepy')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a29429fb28841aea4cbea6192befecb02ac91e2bab856ca5895f495123d64d6a')

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
