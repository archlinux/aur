# Maintainer: Philipp A. <flying-sheep@web.de>

_name=asyncore-wsgi
pkgname=python-$_name
pkgver=0.0.11
pkgrel=1
pkgdesc='Asynchronous WSGI and WebSocket server based on asyncore module.'
arch=(any)
url="https://github.com/romanvm/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5a8f999715ac4222c7a3d4cfa427535ac2dc9adf7e18d1c7e511924864133e16')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
