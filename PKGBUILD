# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=logfire-api
pkgname=python-${_name}
pkgver=3.5.3
pkgrel=1
pkgdesc='Shim for the Logfire SDK which does nothing unless Logfire is installed.'
arch=('any')
url='https://github.com/pydantic/logfire/tree/main/logfire-api'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('2c15a0ad6f12f39003f62550a35f9247c29c87b466f7839836f346867442a55c')
depends=('python>=3.8')
makedepends=('python-hatchling')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
