# Maintainer: dragon <drgn@fn.de>

pkgname=python-pyparsebluray
_pkgname=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="Parse and extract binary data from bluray files"
url="https://github.com/Ichunjo/pyparsebluray"
arch=(any)
license=(MIT)
depends=(python)
conflicts=(python-pyparsebluray-git)
makedepends=(git python-{build,wheel,installer,setuptools})
source=("git+$url#tag=$pkgver")
sha256sums=('SKIP')

build() {
	cd $_pkgname
	python -m build --wheel --no-isolation
}

package() {
	cd $_pkgname
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
