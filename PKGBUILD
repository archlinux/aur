# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=frozenlist
pkgname=python-frozenlist
pkgver=1.2.0
pkgrel=1
pkgdesc='A list-like structure which implements collections.abc.MutableSequence, and which can be made immutable.'
url='https://frozenlist.readthedocs.io'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner' 'python-pytest-mock' 'python-pytest-timeout')
source=("https://github.com/aio-libs/frozenlist/releases/download/v${pkgver}/frozenlist-${pkgver}.tar.gz")
sha512sums=('9a0432d7874e66d71a36c8cb91852bf215aa21fee294f52517eba417a843e1f5e6b10e6a56c690472668c6f2045cf8c72a8c91f00aa0974bf0e37ca993308280')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  python setup.py test
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
