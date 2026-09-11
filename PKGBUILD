# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=logfire-api
pkgname=python-$_name
pkgver=5.1.0
pkgrel=1
pkgdesc='Shim for the Logfire SDK which does nothing unless Logfire is installed.'
arch=('any')
url='https://github.com/pydantic/logfire/tree/main/logfire-api'
license=('MIT')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('16abf9d7d35e08cda2dab66fd0883cabaa4d4206f3dcea0f5967dbc823f01d6d')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
