# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: sumt <sumt at sci dot fi>

_pkgname=py3amf
_pkgname_upper=Py3AMF
pkgname=python-${_pkgname}
pkgver=0.8.10
pkgrel=1
pkgdesc='Python action Message Format (AMF) support'
arch=('any')
url='https://github.com/StdCarrot/Py3AMF'
license=('MIT')
depends=('python-defusedxml')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a5f012da90bcdf6731f8e7f185afed5f57d5fe71863198a03c25f50e884ca536')

build() {
  cd "${_pkgname_upper}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname_upper}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
