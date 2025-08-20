# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=speechmatics-rt
pkgname=python-$_name
pkgver=0.4.1
pkgrel=1
pkgdesc="Speechmatics Real-Time API Client."
arch=('any')
license=('MIT')
url="https://github.com/speechmatics/speechmatics-python-sdk/tree/main/sdk/rt"
depends=('python' 'python-websockets')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-aiohttp: jwt')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('12a6119f0dc73bb3ce59afcb3e8c4cc8ccfa47bd77eaec0bce28993c8d925fe2')

build() {
    cd "$srcdir"/${_name//-/_}-$pkgver
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
