# Maintainer: dreieck
# Contributor: Gasparotto Mattia <gasmat04@gmail.com>

_pkgname=python-gammu
pkgname=python2-gammu
pkgver=2.12
pkgrel=3
pkgdesc="Python2 bindings for Gammu library"
arch=('x86_64')
url="https://wammu.eu/python-gammu/"
license=('GPL')
depends=('python2' 'gammu')
makedepends=('python2-setuptools')
checkdepends=('libdbi-drivers')
source=("https://dl.cihar.com/python-gammu/python-gammu-${pkgver}.tar.bz2")
sha256sums=('efca72146ef5a5f9c7e7763374f28a3f15c6e80a0b7f07ce4fda52863b0cd4d2')

build() {
  cd "${srcdir}/python-gammu-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/python-gammu-${pkgver}"
  python2 setup.py test
}

package() {
  cd "python-gammu-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
