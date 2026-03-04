# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=logfire-api
pkgname=python-$_name
pkgver=4.25.0
pkgrel=1
pkgdesc='Shim for the Logfire SDK which does nothing unless Logfire is installed.'
arch=('any')
url='https://github.com/pydantic/logfire/tree/main/logfire-api'
license=('MIT')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('7562d5adfe3987291039dddb21947c86cb9d832d068c87d9aa23db86ef07095b')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
