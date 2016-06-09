# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=python-pyotp
_pkgname=pyotp
pkgver=2.1.1
pkgrel=1
pkgdesc='PyOTP is a Python library for generating and verifying one-time passwords'
arch=(any)
url=https://pyotp.readthedocs.io/
license=('MIT')
depends=(python-future)
makedepends=(python-setuptools unzip)
source=(https://github.com/pyotp/${_pkgname}/archive/v${pkgver}.zip)
md5sums=('f576468857fbf1b6ac29407f7c653e7c')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}
