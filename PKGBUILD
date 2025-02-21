# Maintainer: redponike <proton (dot) me>

pkgname=python-orange3-imageanalytics
_pkgname=${pkgname#python-}
pkgver=0.13.0
pkgrel=1
pkgdesc="Orange3 add-on for dealing with image related tasks"
url="https://github.com/biolab/orange3-imageanalytics"
arch=('x86_64')
license=('GPL-3.0')
depends=('python-orange' 'python-ndf')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('012c392c5505c4e83dc05e2159ce6863036e553094b4171da9fa1cdf88eea5e2')


build() {
  cd "${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "${_pkgname}-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
