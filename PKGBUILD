# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=adjusttext
pkgname=python-adjusttext
pkgver=1.4.0
pkgrel=1
pkgdesc='Iteratively adjust text position in matplotlib plots to minimize overlaps'
arch=(any)
url="https://github.com/Phlya/$_name"
license=(MIT)
depends=(python python-numpy python-matplotlib python-scipy)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1f73860ced8cccce3f85ee6989ca133c2579b67a7453f63dbeb38f39bf123154')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
