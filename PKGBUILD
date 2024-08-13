# Maintainer: Stefan Gehr <stefan@gehr.xyz>

_name=sty
pkgname=python-${_name}
pkgver=1.0.5
pkgrel=1
pkgdesc="String styling for your terminal"
arch=(any)
url="https://sty.mewo.dev/"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-wheel python-poetry)
source=($pkgname-$pkgver.tar.gz::"https://github.com/feluxe/sty/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("99c3c75111395b26a7d0904cdbe8244363cc65f05e788b6470c45f7033f39a3ad5ab15e8ab3db92bde34f9c76ba78fbca61c2aee18f1f8cf1f7d17bb3c0b2a9c")

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package(){
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
