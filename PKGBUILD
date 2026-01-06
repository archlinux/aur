# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=huey
pkgname=python-$_pyname
pkgver=2.6.0
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
sha256sums=('519bdc606781e1d5dfc20d8735c81fae08913e4c9f03f6b13a18f3899d996b69')

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
