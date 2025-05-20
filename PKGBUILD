# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='namex'
pkgname=("python-${_pkgname}")
pkgdesc='A simple utility to separate the implementation of your Python package and its public API.'
url='https://github.com/fchollet/namex'
license=('Apache-2.0')
pkgver=0.0.9
pkgrel=1
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python')
sha256sums=('8adfea9da5cea5be8f4e632349b4669e30172c7859e1fd97459fdf3b17469253')

build() {
  cd "${srcdir}"/${_pkgname//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package () {
  cd "${srcdir}"/${_pkgname//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
