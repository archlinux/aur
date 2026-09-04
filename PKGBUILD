# Maintainer: Andreas Wendleder <gonsolo@gmail.com>

_pkgname=types-chevron
pkgname=python-types-chevron
pkgver=0.14.2.20260408
pkgrel=1
pkgdesc="Typing stubs for chevron"
arch=('any')
url="https://pypi.org/project/types-chevron/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('5c433fb39f1f9f588ebcf0d99f40127859b4b5be96ada5fbfa4355af96ff3aac')

build() {
  cd "${_pkgname//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
