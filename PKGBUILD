# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='tblfaker'
pkgname="python-${_pkgname}"
pkgver=0.2.3
pkgrel=2
pkgdesc='Python library to generate fake tabular data'
arch=('any')
url='https://github.com/thombashi/tblfaker'
_url_pypi='https://pypi.org/project/tblfaker'
license=('MIT')
depends=('python-faker' 'python-tabledata')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('48e3ff4f2c58d7d3c51ca61a2dcf807c394f54b1cac443d15241127a6169b198')

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
