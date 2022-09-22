# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=samarium
pkgver=0.3.0
pkgrel=1
epoch=
pkgdesc="A dynamic, interpreted language that is transpiled to Python"
arch=(any)
url="https://github.com/samarium-lang/Samarium"
license=('MIT')
depends=('python>=3.9' 'python-termcolor')
makedepends=('python-build' 'python-installer' 'python-poetry')
checkdepends=()
optdepends=()
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=('ca877d8e9f9dae083c20b60117c1e6be97e2cf8c146c7e194d1b6de38ce091d9')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
