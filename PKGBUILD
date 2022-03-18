# Maintainer: Philipp A. <flying-sheep@web.de>

_name=yte
pkgname=python-$_name
pkgver=1.2.0
pkgrel=1
pkgdesc='YAML template engine with Python expressions'
arch=(any)
url="https://github.com/koesterlab/$_name"
license=(MIT)
depends=(python-plac python-pyyaml)
makedepends=(python-build python-installer python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0368f220bb96fb3290bbd5a90e3d218af483d0d3e5abf9b08b24e29b150f151e')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
