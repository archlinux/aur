# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=("python-wrapt")
pkgver=1.10.5
pkgrel=2
pkgdesc="A Python module for decorators, wrappers and monkey patching."
arch=("i686" "x86_64")
url="https://pypi.python.org/pypi/wrapt"
license=("BSD")
source=("https://pypi.python.org/packages/source/w/wrapt/wrapt-${pkgver}.tar.gz")
sha256sums=('99cbb4e3a3ea964df0cb1437261fc1198616ec872e7b501622f3f7f92fcd0833')

build() {
  cd "${srcdir}/wrapt-${pkgver}/"
  python setup.py build
}

package_python-wrapt() {
  depends=('python')
  cd "${srcdir}/wrapt-${pkgver}/"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
