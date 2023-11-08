# Maintainer: quest <quest@mac.com>
pkgname=python-ygglatency
_pkgname="ygglatency"
pkgver=0.2.2
pkgrel=2
pkgdesc="Find the fastest Yggdrasil peers."
arch=("any")
url="https://pypi.python.org/pypi/$_pkgname"
license=("MIT")
depends=("python" "python-bs4" "python-requests" "python-icmplib")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/6e/c3/c61f5853a3bfc5d640e44a8f19d14dc51e13e03689cc75fb1731d08cd2f6/$_pkgname-$pkgver.tar.gz")
sha256sums=('a4343ab5bf3a0c07adb06bb38068491c1df8ec52b6b8b204516071a16f9cdef5')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
