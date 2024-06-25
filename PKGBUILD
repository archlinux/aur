# Maintainer: Aaron Coach <aur at ezpz.cz>

pkgname=python-async_interrupt
_pkgname=async_interrupt
pkgver=1.1.2
pkgrel=1
pkgdesc="Python library that provides interrupt context manager for asyncio"
arch=('any')
url="https://github.com/bdraco/async_interrupt"
license=('Apache')
depends=('python')
makedepends=('python-poetry')
source=("https://files.pythonhosted.org/packages/source/a/async_interrupt/async_interrupt-${pkgver}.tar.gz")
sha256sums=('7a67c229d3d337e8db852cfe3c7e3012930a39eb4a4b30c036452a6f278d08f1')

build() {
	cd $_pkgname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
