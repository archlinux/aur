# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='envinfopy'
pkgname="python-${_pkgname}"
pkgver=0.0.3
pkgrel=2
pkgdesc='Python Library to get execution environment information'
arch=('any')
url='https://github.com/thombashi/envinfopy'
_url_pypi='https://pypi.org/project/envinfopy'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cbee4e6ea91b48b9cfafc5817aa97a44f1d61065a9aa37e5e909838da232ec20')

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
