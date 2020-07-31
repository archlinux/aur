# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname=pytablereader
pkgname=python-${_pkgname}
pkgver=0.30.0
pkgrel=1
pkgdesc='Load structured table data from various file formats'
arch=('any')
url='https://github.com/thombashi/pytablereadera'
license=('MIT')
depends=('python-beautifulsoup4' 'python-dataproperty' 'python-jsonschema' 'python-mbstrdecoder' 'python-path' 'python-pathvalidate' 'python-tabledata' 'python-typepy')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cb45e968e1a781468196b4c65ec23347eeed0d3985d70bfa8bfbd6d9533fa935')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.rst' "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
