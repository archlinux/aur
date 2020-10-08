pkgname=python-pyfmi
pkgver=2.8
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="http://www.pyfmi.org"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython')
depends=('fmilib' 'python-scipy' 'python-lxml' 'python-assimulo')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('b00e967a5bbe0325e28ae20bbc147320b695baf6a1cfa2c384731dcc0488e273')

build() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py build --fmil-home=/usr/
}

package() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}


