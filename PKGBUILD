# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=phonic
pkgname=python-$_name
pkgver=0.32.2
pkgrel=1
pkgdesc='The Phonic Python library provides convenient access to the Phonic APIs from Python.'
arch=('any')
url='https://github.com/Phonic-Co/phonic-python'
license=('MIT')
depends=('python' 'python-httpx' 'python-pydantic' 'python-pydantic-core' 'python-typing_extensions' 'python-websockets')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('4c488e41f48633ab83a854d50987a879dcca3318dc83becd7c24a49e396a3137')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
