# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=pipe
pkgname=python-$_pkgname
pkgver=2.2
pkgrel=1
epoch=
pkgdesc="A Python library to use infix notation in Python "
arch=(any)
url="https://github.com/JulienPalard/Pipe"
license=('MIT')
depends=('python>=3.7')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
	"$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
)
sha256sums=('6a253198e3bc542ffaf0a4222376586bce8583b27a9ddbc2cfbaa554c049230d')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
