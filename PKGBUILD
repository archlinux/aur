# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='pytablewriter-altrow-theme'
pkgname="python-${_pkgname}"
pkgver=0.0.2
pkgrel=2
pkgdesc='pytablewriter plugin to provide a theme that colored rows alternatively'
arch=('any')
url='https://github.com/thombashi/pytablewriter-altrow-theme'
_url_pypi='https://pypi.org/project/pytablewriter-altrow-theme'
license=('MIT')
depends=('python' 'python-pytablewriter' 'python-tcolorpy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('4fc14a914ee99f707c81a6d8a29f79e61b6d2e74dae7a03c7fc6342b5cae5398')

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
