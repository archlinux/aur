pkgname=python-pyfmi
pkgver=2.19.0
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard"
url="https://github.com/modelon-community/PyFMI"
arch=(x86_64)
license=(LGPL-3.0-only)
makedepends=(python-setuptools cython)
depends=(glibc fmilib python python-numpy python-scipy python-assimulo)
optdepends=('python-matplotlib: plots')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('cbcf4d925f65aba31f00d9ecae3529d5f186655550beecca69ba238dc4e4bebc')

prepare() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
}

package() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}
