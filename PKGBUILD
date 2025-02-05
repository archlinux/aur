# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pydantic-graph
pkgname=python-${_name}
pkgver=0.0.22
pkgrel=1
pkgdesc='Agent Framework / shim to use Pydantic with LLMs.'
arch=('any')
url='https://github.com/pydantic/pydantic-ai'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('c72baca5c1ac7f5445a52bbe63c25c0d060c6b70b7de956700753b2401f470fe')
depends=('python>=3.9' 'python-httpx' 'python-logfire-api' 'python-pydantic')
makedepends=('python-setuptools' 'python-wheel')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
