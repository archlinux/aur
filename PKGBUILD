pkgname=python-pyfmi
pkgver=2.5.1
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="http://www.pyfmi.org"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython')
depends=('fmilib' 'python-scipy' 'python-lxml' 'python-assimulo')
source=("https://github.com/modelon/PyFMI/archive/PyFMI-${pkgver}.tar.gz")
#source=("https://pypi.io/packages/source/P/PyFMI/PyFMI-${pkgver}.tar.gz")
sha256sums=('f59d2634b346d66ce0271aa1d689255a9b400b02570b4007020a10f3d6b92797')

prepare() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  #rm src/pyfmi/*.c
}

build() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py build --fmil-home=/usr/
}

package() {
  cd "${srcdir}"/PyFMI-PyFMI-${pkgver}
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}


