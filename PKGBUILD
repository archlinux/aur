# Contributor: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=python-discord-webhook
pkgver=1.4.1
pkgrel=1
pkgdesc="Execute Discord webhooks."
arch=('any')
url="https://github.com/lovvskillz/python-discord-webhook"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4b062eee99d813fb3b2063905373f3b6b03f5d7bd5456ea92e7ae4561e225520')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}
check() {
	cd "$srcdir/$pkgname-$pkgver"
	pytest
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
