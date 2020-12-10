# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=result
pkgname="python-${_pkgname}"
pkgver=0.5.0
pkgrel=1
pkgdesc="A rust-like result type for Python"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz")
sha256sums=('f4563ff615b1147822d13eb363fbda202511fcbf281b3cf7acf0723ca7cb612b')
b2sums=('b6691551452a0b3cea8bee81b7f17b1495cfb56b446ce20007d3a2f12b00ab516e80dda7cde0084151fd9b9a86daa67899cde1e3d2ab921c6d2253359702894c')

build() {
  cd "${_pkgname//-/_}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname//-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
