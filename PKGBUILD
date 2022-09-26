pkgname=python-pyfmi
pkgver=2.9.8
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="http://www.pyfmi.org"
arch=('x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython')
depends=('fmilib' 'python-scipy' 'python-lxml' 'python-assimulo')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
sha256sums=('3d7c24428545e43e6e8af42efe3860743e5cc2830e56b9574dd6c687ccf9aadc')

build() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py build --fmil-home=/usr/
}

package() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}


