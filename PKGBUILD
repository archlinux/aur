# Maintainer: Stefan Gehr <stefangehr@protonmail.com>

_name=tr064
pkgname=python-tr064
pkgver=0.1.1
pkgrel=2
pkgdesc="Lightweight and Straight-Forward TR-064 Client"
arch=(any)
url="https://github.com/bfueldner/tr064"
license=(MIT)
depends=(python-requests python-lxml)
makedepends=(python-build python-installer python-wheel python-setuptools git python-pytest-runner)
source=(git+"https://github.com/bfueldner/tr064#commit=6b12f879fa5ccec4cd2d68fac48db1c2815f131c")
b2sums=("SKIP")

build() {
	cd $_name
	python -m build --wheel --no-isolation
}

package() {
	cd $_name
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
