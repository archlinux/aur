pkgname=python-pyfmi
pkgver=2.20.0
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard"
url="https://github.com/modelon-community/PyFMI"
arch=(x86_64)
license=(LGPL-3.0-only)
makedepends=(python-setuptools cython)
depends=(glibc fmilib python python-numpy python-scipy python-assimulo)
optdepends=('python-matplotlib: plots')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('8a010673024973b3742d2029d49d8129975440d833e0b3048d94661ca147cf65')

prepare() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
}

package() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}
