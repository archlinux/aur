# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=proslenkey
pkgver=1.1.0
pkgrel=1
pkgdesc='A lightweight GTK4 application launcher for Wayland'
arch=(any)
url='https://github.com/hikyae/proslenkey'
license=(MIT)
depends=(
	python
	python-gobject
	gtk4-layer-shell
)
makedepends=(
	python-hatchling
	python-installer
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/hikyae/proslenkey/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36bc3f7dbeeba44e3ca7556c75850e8f279bcd746799a83c090345a51e91bf2a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m hatchling build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

