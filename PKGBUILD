# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=samarium
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A dynamic, interpreted language that is transpiled to Python"
arch=(any)
url="https://github.com/samarium-lang/Samarium"
license=('MIT')
depends=('python>=3.8')
makedepends=('python-build' 'python-installer' 'python-poetry')
checkdepends=()
optdepends=()
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=('eba466aca056766338ad861e1a6f873bf127c4187bb5268896bc5a43d3e1e3a7')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
