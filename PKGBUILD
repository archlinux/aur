# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname="python-debtcollector"
pkgver=0.5.0
pkgrel=1
pkgdesc="A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner."
arch=("any")
url="https://pypi.python.org/pypi/debtcollector"
license=("Apache")
makedepends=('python-pbr')
source=("https://pypi.python.org/packages/source/d/debtcollector/debtcollector-${pkgver}.tar.gz")
sha256sums=('4ddab1c494ce9c714a2b6f88a01bf1226a1b20d584bcf65d1593a2e4ca63b42a')

build() {
  cd "${srcdir}/debtcollector-${pkgver}/"
  python setup.py build
}

package_python-debtcollector() {
  depends=('python-pbr>=0.11'
           'python-babel>=1.3'
           'python-six>=1.9.0'
           'python-wrapt>=1.7.0'
           )
  cd "${srcdir}/debtcollector-${pkgver}/"
  python setup.py install --root="${pkgdir}/"
}
