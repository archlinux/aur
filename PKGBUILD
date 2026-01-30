# Maintainer: Andreas Wendleder <gonsolo@gmail.com>

_pkgname=types-chevron
pkgname=python-types-chevron
pkgver=0.14.2.20250103
pkgrel=1
pkgdesc="Typing stubs for chevron"
arch=('any')
url="https://pypi.org/project/types-chevron/"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('9dacdc9b01bdf717bcb7930f0602b9b74add054ebf3cf38d282b7e2b64c9d076')

build() {
  cd "${_pkgname//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
