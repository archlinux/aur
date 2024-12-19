pkgname=python-pyfmi
pkgver=2.16.1
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="https://github.com/modelon-community/PyFMI"
arch=('x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython')
depends=('fmilib' 'python-scipy' 'python-assimulo')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('207ff038fea73c9f8458066dffd8152cd28ca1063afeaf44f81c57c33ac9ac70')

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


