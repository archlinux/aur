# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=proslenkey
pkgver=1.0.0
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
sha256sums=('7afc4443242085dbff7fece5ea85052089fd8d0a5c999069a1893709e4c47065')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m hatchling build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

