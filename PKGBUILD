# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-oslo-policy-kilo"
pkgver=0.3.2
pkgrel=1
pkgdesc="Oslo Policy"
arch=("any")
url="https://pypi.python.org/pypi/oslo.policy"
license=("Apache")
provides=("python2-oslo-policy")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.policy/oslo.policy-${pkgver}.tar.gz")
sha256sums=('e69a5c559f95bcbf91eb0ea9f16aa65f0fe5fccc7fa03693d4cc991b76e969a6')

build() {
  cd "${srcdir}/oslo.policy-${pkgver}/"
  python2 setup.py build
}

package_python2-oslo-policy-kilo() {
  depends=('python2-oslo-config>=1.2.0' 'python2-oslo-i18n-kilo>=1.3.0' 'python2-oslo-serialization-kilo>=1.4.0')
  cd "${srcdir}/oslo.policy-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
