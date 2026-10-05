# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=speechmatics-rt
pkgname=python-$_name
pkgver=1.2.1
pkgrel=1
pkgdesc="Speechmatics Real-Time API Client."
arch=('any')
url="https://github.com/speechmatics/speechmatics-python-sdk/tree/main/sdk/rt"
license=('MIT')
depends=('python'
         'python-websockets'
         'python-typing_extensions')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
optdepends=('python-aiohttp: jwt')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('8370f738cee9507fca18c8df88cf2cd029b7dc6810c8e854d35478241d080ca4')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
