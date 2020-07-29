# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=savepagenow
pkgname=python-${_pkgname}
pkgver=1.0.1
pkgrel=1
pkgdesc='Wrapper for archive.org Save Page Now capturing service'
arch=('any')
url='https://github.com/pastpages/savepagenow/'
license=('MIT')
depends=('python-click' 'python-requests')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('125037683da5b9429dfbe826d89eed0cb325ee8c326fb6abd707600cc8a1242e')

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
