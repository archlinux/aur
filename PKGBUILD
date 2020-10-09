# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='rapidfuzz'
pkgname="python-${_pkgname}"
pkgver=0.12.3
pkgrel=1
pkgdesc='Rapid fuzzy string matching in Python and C++ using the Levenshtein Distance'
arch=('x86_64')
url='https://github.com/maxbachmann/rapidfuzz'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4c181212546cdaa8dada02dbb4212c7ea9a04ba31237b2024be3c76af7e01d08')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
