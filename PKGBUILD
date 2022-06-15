# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-wrapt"
pkgver=1.14.1
pkgrel=1
pkgdesc="A Python module for decorators, wrappers and monkey patching."
arch=("any")
url="https://pypi.python.org/pypi/wrapt"
license=("BSD")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/w/wrapt/wrapt-${pkgver}.tar.gz")
sha256sums=('380a85cf89e0e69b7cfbe2ea9f765f004ff419f34194018a6827ac0e3edfed4d')

build() {
  cd "${srcdir}/wrapt-${pkgver}/"
  python2 setup.py build
}

package_python2-wrapt() {
  cd "${srcdir}/wrapt-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/LICENSE"
}
