# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname=mbstrdecoder
pkgname=python-${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc='Multi-byte character string decoder'
arch=('any')
url='https://github.com/thombashi/mbstrdecoder'
license=('MIT')
depends=('python-chardet')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9df7778c0c051c98f6b5a848909202e5cd423c9692665b20d1a9bd0f771b8235')

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
