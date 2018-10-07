# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-rxv
pkgname=('python-rxv' 'python2-rxv')
pkgver=0.6.0
pkgrel=1
pkgdesc="Automation Library for Yamaha RX-V473, RX-V573, RX-V673, RX-V773 receivers."
arch=('any')
url='https://github.com/wuub/rxv'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python' 'python2')
source=("https://files.pythonhosted.org/packages/67/01/f2c35d41cbef0e236122572da177d4684fa0a924e521538c194b020729dc/rxv-${pkgver}.tar.gz")
sha256sums=('aa1d707fb4f6d71581aca9a864fb03e62f001b32c835b72ddba5cfdb5c3a661f')

check() {
  cd "${srcdir}/rxv-${pkgver}"
  python setup.py test
  python2 setup.py test
}

package_python-rxv() {
  depends=('python-defusedxml')
  pkgdesc="Automation Library for Yamaha RX-V473, RX-V573, RX-V673, RX-V773 receivers. (python3 version)"

  cd "${srcdir}/rxv-${pkgver}"
  python setup.py install --root=${pkgdir} 
}

package_python2-rxv() {
  depends=('python2-defusedxml')
  pkgdesc="Automation Library for Yamaha RX-V473, RX-V573, RX-V673, RX-V773 receivers. (python2 version)"

  cd "${srcdir}/rxv-${pkgver}"
  python2 setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
