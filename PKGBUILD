pkgname=python-pyfmi
pkgver=2.17.2
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="https://github.com/modelon-community/PyFMI"
arch=('x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython')
depends=('fmilib' 'python-scipy' 'python-assimulo')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('43f9449c23e5a1a4389d251a56d017fcce0dcdf2497b03f6d40dbfa57f61c84e')

prepare() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
}

build() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py build --fmil-home=/usr/
}

package() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}


