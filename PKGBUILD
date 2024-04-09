# Maintainer: Aaron Coach <aur at ezpz.cz>

pkgname=python-async_interrupt
_pkgname=async_interrupt
pkgver=1.1.1
pkgrel=1
pkgdesc="Python library that provides happy eyeballs algorithm for asyncio."
arch=('any')
url="https://github.com/bdraco/async_interrupt"
license=('MIT')
depends=('python')
makedepends=('python-poetry')
source=("https://files.pythonhosted.org/packages/source/a/async_interrupt/async_interrupt-${pkgver}.tar.gz")
sha256sums=('1e5999f0980b5db21293e4cd022518eeaf52284c0499631932a1df250cb99215')

build() {
	cd $_pkgname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
