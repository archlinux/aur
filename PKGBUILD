# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=huey
pkgname=python-$_pyname
pkgver=3.3.3
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
sha256sums=('b6362cdfaa098fe61f48df1c8a036cdc5dc6db8b1bf00f9752d4614077d1db0d')

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
