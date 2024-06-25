pkgname=python-pyfmi
pkgver=2.13.1
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="https://github.com/modelon-community/PyFMI"
arch=('x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython')
depends=('fmilib' 'python-scipy' 'python-assimulo')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('c6453baa45229fd720eb26b4423d6632e5e9703123dd7a7852af1e5d0488f2e1')

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


