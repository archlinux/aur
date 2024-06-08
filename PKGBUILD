# Maintainer: Jax Young <jaxvanyang@gmail.com>
_name=batchlink
pkgname="python-$_name"
pkgver=1.0.0
pkgrel=1
pkgdesc='Batch link file utility and library'
arch=('any')
url='https://github.com/jaxvanyang/batchlink'
license=('MIT')
depends=('python>=3.10')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-pdm-backend'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaxvanyang/$_name/archive/v$pkgver.tar.gz")
sha256sums=('f9a193466c119e9ee61f57e12f771b11cf250a366d154c5693c30172549d1d5c')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
