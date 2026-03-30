# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>

pkgname=python-compoundfiles
_pkg="${pkgname#python-}"
_pkgfirst="${_pkg:0:1}"
pkgver=0.3
pkgrel=1
pkgdesc="Python module for reading Compound File Binary Format files"
arch=('any')
url='https://github.com/waveform-computing/compoundfiles'
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/$_pkgfirst/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('a435c1053786850a78b74b9ba6a317aab2ae97442d48f3ec5392dc2c51c161e9')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
