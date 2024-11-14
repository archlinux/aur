pkgname=python-pyfmi
pkgver=2.15.0
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="https://github.com/modelon-community/PyFMI"
arch=('x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython')
depends=('fmilib' 'python-scipy' 'python-assimulo')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('32c9fa3fb83e8101048f3bfeb1639ba1b119084c5bd738f0fe65d4d4f925ae09')

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


