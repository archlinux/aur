pkgname=python-pyfmi
pkgver=2.20.1
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard"
url="https://github.com/modelon-community/PyFMI"
arch=(x86_64)
license=(LGPL-3.0-only)
makedepends=(python-setuptools cython)
depends=(glibc fmilib python python-numpy python-scipy python-assimulo)
optdepends=('python-matplotlib: plots')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('4ad49e229ee1bc2987388d0998e0adbb79230767d996373a27b41c6451909c95')

prepare() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
}

package() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}
