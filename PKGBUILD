# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

_pkgname='catalogue'
pkgname="python-${_pkgname}"
pkgver=2.0.1
pkgrel=2
pkgdesc='Super lightweight function registries for your library'
arch=('any')
url='https://github.com/explosion/catalogue'
_url_pypi='https://pypi.org/project/catalogue'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('0d01077dbfca7aa53f3ef4adecccce636bce4f82e5b52237703ab2f56478e56e')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
