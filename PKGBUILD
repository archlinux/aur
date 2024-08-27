# Maintainer: Aaron Coach <aur at ezpz.cz>

pkgname=python-async_interrupt
_pkgname=async_interrupt
pkgver=1.2.0
pkgrel=1
pkgdesc="Python library that provides interrupt context manager for asyncio"
arch=('any')
url="https://github.com/bdraco/async_interrupt"
license=('Apache')
depends=('python')
makedepends=('python-poetry')
source=("https://files.pythonhosted.org/packages/source/a/async_interrupt/async_interrupt-${pkgver}.tar.gz")
sha256sums=('d147559e2478501ad45ea43f52df23b246456715a7cb96e1aebdb4b71aed43d5')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
