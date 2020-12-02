# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='DateTimeRange'
pkgname="python-${_pkgname,,}"
pkgver=1.0.0
pkgrel=2
pkgdesc='Python library to handle a time range'
arch=('any')
url='https://github.com/thombashi/DateTimeRange'
_url_pypi='https://pypi.org/project/DateTimeRange'
license=('MIT')
depends=('python-dateutil' 'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8b884202c0aa663e425d0611cc87a9f694d8696e0473d12519c8e08bd394f6be')

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
