# Maintainer: Philipp A. <flying-sheep@web.de>
_name=pyahocorasick
pkgname=python-ahocorasick
pkgver=1.4.4
pkgrel=1
pkgdesc='Fast and memory efficient exact or approximate multi-pattern string search'
arch=(any)
url="https://github.com/WojciechMula/$_name"
license=(BSD)
depends=(python)
makedepends=(python-setuptools python-installer python-build)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('32545cad135660ceef556f1d987aee3206e00096735405d7a8de84eb0a15bb27')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
