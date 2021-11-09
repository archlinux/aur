# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=aiosignal
pkgname=python-aiosignal
pkgver=1.2.0
pkgrel=2
pkgdesc='A list of registered asynchronous callbacks'
url='https://aiosignal.readthedocs.io'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('Apache')
depends=('python' 'python-frozenlist')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner' 'python-pytest-mock' 'python-pytest-timeout')
source=("https://github.com/aio-libs/aiosignal/releases/download/v${pkgver}/aiosignal-${pkgver}.tar.gz")
sha512sums=('e3e0d0afa60cfe1bfb999f6eae0c97c4c473fb040efe402900924eade57e2bd6314892e134ac4ae26f719b05730880f6904bf03c6fbc0be4ddd02faf7f0c5d78')

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
