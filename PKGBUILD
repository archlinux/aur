# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=speechmatics-rt
pkgname=python-$_name
pkgver=1.0.0
pkgrel=1
pkgdesc="Speechmatics Real-Time API Client."
arch=('any')
url="https://github.com/speechmatics/speechmatics-python-sdk/tree/main/sdk/rt"
license=('MIT')
depends=('python' 'python-websockets')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-aiohttp: jwt')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a9dffbd8e8f800e2d7362acb0244fc9ff3ec350c9d8b9c9170339c7c6ca837e1')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
