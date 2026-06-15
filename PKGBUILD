# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=huey
pkgname=python-$_pyname
pkgver=3.0.3
pkgrel=1
pkgdesc='huey, a little task queue'
arch=(any)
url="https://github.com/coleifer/$_pyname"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
optdepends=(python-redis)
checkdepends=(python-pytest
              python-redis)
_archive="$_pyname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('5694fc2d46b1d1481728a7df3dd5b36c7a10841bce8d72acd1597fd94339e899')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
