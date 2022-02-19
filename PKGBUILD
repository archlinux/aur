# Maintainer: Philipp A. <flying-sheep@web.de>

_name=wheel-inspect
pkgname=python-$_name
pkgver=1.7.0
pkgrel=2
pkgdesc='Extract information from wheels'
arch=(any)
url="https://github.com/jwodder/$_name"
license=(MIT)
depends=(python python-attrs python-entry-points-txt python-headerparser python-packaging python-readme-renderer python-wheel-filename)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e3a930c841e1d6d233fd2d213ee6ce07e990006a32d73b0f89937b539db26af6')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
