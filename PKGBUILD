# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=proslenkey
pkgver=1.1.1
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
sha256sums=('053d526d2809b2389a1cef27f853f1eb2c6770c5c391c39b52f33b59594239a1')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m hatchling build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

