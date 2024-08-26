pkgname=python-pyfmi
pkgver=2.14.0
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="https://github.com/modelon-community/PyFMI"
arch=('x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython')
depends=('fmilib' 'python-scipy' 'python-assimulo')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('93f837a283af5a4bd25b29788c32e674f6b97eb853b4e42bc63a0e299a5e5a68')

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


