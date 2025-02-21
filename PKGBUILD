# Maintainer: redponike <proton (dot) me>

pkgname=python-ndf
_pkgname=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="NumPy based deep learning package. Made for evaluate already trained models in production."
arch=('x86_64')
url="https://github.com/primozgodec/ndf"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-pillow')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a87c0bd2cccbc438d24859cbe64de34157b432f104d0e7b59b0610264b538522')

build() {
  cd "${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "${_pkgname}-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
