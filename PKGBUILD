# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-base32_crockford
_pkgname=base32-crockford
pkgver=0.3.0
pkgrel=1
pkgdesc="A Python implementation of Douglas Crockford's base32 encoding scheme"
arch=("any")
url="https://github.com/jbittel/base32-crockford"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('115f5bd32ae32b724035cb02eb65069a8824ea08c08851eb80c8b9f63443a969')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
