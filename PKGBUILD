# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='savepagenow'
pkgname="python-${_pkgname}"
pkgver=1.1.0
pkgrel=1
pkgdesc='Wrapper for archive.org Save Page Now capturing service'
arch=('any')
url='https://github.com/pastpages/savepagenow'
license=('MIT')
depends=('python' 'python-click' 'python-requests')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('002892ffb15e5ffad8c1ec09989667bb44f42a2b59415bf021c46833a76b2d60')

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
