# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>

_pkgname='dialite'
pkgname="python-${_pkgname}"
pkgver=0.5.3
pkgrel=2
pkgdesc='Lightweight pure-Python package to show simple dialogs'
arch=('any')
url='https://github.com/flexxui/dialite'
_url_pypi='https://pypi.org/project/dialite'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('de968f805fdc7f5545f15f5e17c2472198e0f6665b77f72be056f553d99292ef')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
