# Maintainer: Philipp A. <flying-sheep@web.de>

_name=yte
pkgname=python-$_name
pkgver=1.5.1
pkgrel=1
pkgdesc='YAML template engine with Python expressions'
arch=(any)
url="https://github.com/koesterlab/$_name"
license=(MIT)
depends=(python-dpath python-plac python-pyyaml)
makedepends=(python-build python-installer python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6d0b315b78af83276d78f5f67c107c84238f772a76d74f4fc77905b46f3731f5')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
