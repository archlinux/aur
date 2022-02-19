# Maintainer: Philipp A. <flying-sheep@web.de>

_name=legacy-api-wrap
pkgname=python-$_name
pkgver=1.2
pkgrel=2
pkgdesc='Legacy API wrapper.'
arch=(any)
url="https://github.com/flying-sheep/$_name"
license=(GPL3)
depends=(python-get_version python-setuptools)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('034a44612da7e9943d3964363a98937ab54d55e3301075374abe0d521eb8101b')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
