# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-policy-liberty"
pkgver=0.6.0
pkgrel=1
pkgdesc="Oslo Policy"
arch=("any")
url="https://pypi.python.org/pypi/oslo.policy"
license=("Apache")
provides=("python2-oslo-policy")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.policy/oslo.policy-${pkgver}.tar.gz")
sha256sums=('49fd7746ad87253112673178050083fa66e78b51a4f9a063b4366f9d0c6a4df8')

build() {
  cd "${srcdir}/oslo.policy-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-policy-liberty() {
  depends=('python2-oslo-config-liberty'
           'python2-oslo-i18n-liberty'
           'python2-oslo-serialization-liberty')
  cd "${srcdir}/oslo.policy-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
