# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=tblfaker
pkgname=python-${_pkgname}
pkgver=0.2.3
pkgrel=1
pkgdesc='Python library to generate fake tabular data'
arch=('any')
url='https://github.com/thombashi/tblfaker'
license=('MIT')
depends=('python' 'python-faker' 'python-tabledata')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('48e3ff4f2c58d7d3c51ca61a2dcf807c394f54b1cac443d15241127a6169b198')

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
