# Maintainer: Jax Young <jaxvanyang@gmail.com>
_name=batchlink
pkgname="python-$_name"
pkgver=1.1.0
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
sha256sums=('f79f08f65fe3c8dc2b70ab9bef97b31d8e1424a20d23049ad61340f5c5247ab0')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
