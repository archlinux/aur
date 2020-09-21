# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>

_pkgname='dialite'
pkgname="python-${_pkgname}"
pkgver=0.5.3
pkgrel=1
pkgdesc='Lightweight pure-Python package to show simple dialogs'
arch=('any')
url='https://github.com/flexxui/dialite'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('de968f805fdc7f5545f15f5e17c2472198e0f6665b77f72be056f553d99292ef')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
