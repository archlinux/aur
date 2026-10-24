# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=huey
pkgname=python-$_pyname
pkgver=3.5.3
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
sha256sums=('18c905f91c34cb3fcf4a6c013601b47009eb4bbc17adb7901c44fe69911e19c2')

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
