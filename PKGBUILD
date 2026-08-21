# Maintainer: hikyae <h1ky43@gmail.com>

pkgname=proslenkey
pkgver=1.2.0
pkgrel=0
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
sha256sums=('8987b6a41daaeedbf693d2a2e003ebca4d535d60bf939985ba3037f9ff50ccf6')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m hatchling build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

