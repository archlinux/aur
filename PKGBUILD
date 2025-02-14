# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='namex'
pkgname=("python-${_pkgname}")
pkgdesc='A simple utility to separate the implementation of your Python package and its public API.'
url='https://github.com/fchollet/namex'
license=('Apache-2.0')
pkgver=0.0.8
pkgrel=1
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python')
b2sums=('9b9d1612a27afa2be18bf59352a40f28a9a30429ec88c0a6eb8cc2740136e155f660b9f30d5384411fba6d759ea10be1b2a4b94398604822a5ee2a6239fbf2a0')

build() {
  cd "${srcdir}"/${_pkgname//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package () {
  cd "${srcdir}"/${_pkgname//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
