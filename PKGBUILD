# Maintainer: Jax Young <jaxvanyang@gmail.com>
_name=batchlink
pkgname="python-$_name"
pkgver=0.1.0
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
sha256sums=('f1805033cb37b3981efb91e48a4240cb8e3c89557c907fadb61912076edc7d02')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
