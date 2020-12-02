# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='tcolorpy'
pkgname="python-${_pkgname}"
pkgver=0.0.8
pkgrel=2
pkgdesc='Python library to apply true color for terminal text'
arch=('any')
url='https://github.com/thombashi/tcolorpy'
_url_pypi='https://pypi.org/project/tcolorpy'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ffbe886f1321dab88d9cfd4218ea8d93d50d6ad0875c3741dd75fe1437379406')

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
