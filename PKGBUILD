# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=DateTimeRange
pkgname=python-${_pkgname,,}
pkgver=1.0.0
pkgrel=1
pkgdesc='Python library to handle a time range'
arch=('any')
url='https://github.com/thombashi/DateTimeRange'
license=('MIT')
depends=('python' 'python-dateutil' 'python-typepy')
makedepends=('python-setuptools')
provides=("${_pkgname,,}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8b884202c0aa663e425d0611cc87a9f694d8696e0473d12519c8e08bd394f6be')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname,,}" 'README.rst'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname,,}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
