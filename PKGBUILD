# Maintainer: Philipp A. <flying-sheep@web.de>

_name=wheel-filename
pkgname=python-$_name
pkgver=1.4.1
pkgrel=2
pkgdesc='Parse wheel filenames'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('87891c465dcbb40b40394a906f01a93214bdd51aa5d25e3a9a59cae62bc298fd')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
