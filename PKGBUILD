# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=huey
pkgname=python-$_pyname
pkgver=2.5.2
pkgrel=2
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
sha256sums=('3a2a33a003ec224f47e2f7897c25fb0e8c40726b30f0e1124e7ed6b01fd3be9d')

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
