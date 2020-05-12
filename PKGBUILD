pkgname=python-pyfmi
pkgver=2.7.1
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="http://www.pyfmi.org"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython')
depends=('fmilib' 'python-scipy' 'python-lxml' 'python-assimulo')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('334ae1d629794487d92ecaba23e2b51226f5320db7267ec764c9dcc6df35fd41')

build() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py build --fmil-home=/usr/
}

package() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}


