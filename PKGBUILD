# Maintainer: Philipp A. <flying-sheep@web.de>
_name=requests_download
pkgname=python-$_name
pkgver=0.1.2
pkgrel=4
pkgdesc='Download to a local file using requests'
arch=(any)
url="https://github.com/takluyver/$_name"
license=('MIT')
depends=(python python-requests)
makedepends=(python-flit-core python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('92d895a6ca51ea51aa42bab864bddaee31b5601c7e7e1ade4c27b0eb6695d846')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
