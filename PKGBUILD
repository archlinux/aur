# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='savepagenow'
pkgname="python-${_pkgname}"
pkgver=1.1.0
pkgrel=2
pkgdesc='Wrapper for archive.org Save Page Now capturing service'
arch=('any')
url='https://github.com/pastpages/savepagenow'
_url_pypi='https://pypi.org/project/savepagenow'
license=('MIT')
depends=('python-click' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('002892ffb15e5ffad8c1ec09989667bb44f42a2b59415bf021c46833a76b2d60')

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
