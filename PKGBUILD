# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=logfire-api
pkgname=python-$_name
pkgver=5.2.0
pkgrel=1
pkgdesc='Shim for the Logfire SDK which does nothing unless Logfire is installed.'
arch=('any')
url='https://github.com/pydantic/logfire/tree/main/logfire-api'
license=('MIT')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('06553f4a4b1b54d094dd01708f51cde69ccd5e8a06fc2664bece3491b593390d')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
