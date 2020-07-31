# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pkgname=tcconfig
pkgname=python-${_pkgname}
pkgver=0.26.0
pkgrel=1
pkgdesc='tc command wrapper'
arch=('any')
url='https://github.com/thombashi/tcconfig'
license=('MIT')
depends=('python-dataproperty'
         'python-docker'
         'python-humanreadable'
         'python-loguru'
         'python-msgfy'
         'python-path'
         'python-pyparsing'
         'python-pyroute2'
         'python-simplesqlite'
         'python-subprocrunner'
         'python-typepy'
         'python-voluptuous')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b4b064f96c28f7a171552e2854c04849585fd47aba6df46539a0de776a4eebbc')

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
