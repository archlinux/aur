# Maintainer: Stefan Gehr <stefangehr@protonmail.com>

_name=tr064
pkgname=python-tr064
pkgver=0.1.1
pkgrel=1
pkgdesc="Lightweight and Straight-Forward TR-064 Client"
arch=(any)
url="https://github.com/bfueldner/tr064"
license=(MIT)
depends=(python-requests python-lxml)
makedepends=(git python-pip)
source=(git+"https://github.com/bfueldner/tr064#commit=6b12f879fa5ccec4cd2d68fac48db1c2815f131c")
b2sums=("SKIP")

build() {
	cd $_name
	python setup.py build
}

package() {
	cd $_name
	python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
