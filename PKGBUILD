# Maintainer: Alex S. <alex@lagomor.ph>
pkgname=xdplayer
pkgver=1.0
pkgrel=1
pkgdesc="Terminal crossword puzzle player"
arch=('any')
url="https://github.com/devottys/xdplayer"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/devottys/xdplayer/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

sha256sums=('de47c513552e0a0a5f20138171e69fd8f140f8c72380881f1c86eb0e6ffda5aa')
