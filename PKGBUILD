# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mumulhl <mumulhl@duck.com>

pkgname=python-giturlparse
_pyname=giturlparse
pkgver=0.16.0
pkgrel=1
pkgdesc='A Git URL parsing module (supports parsing and rewriting)'
url="https://github.com/nephila/$_pyname"
license=(Apache-2.0)
arch=(any)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("$url/archive/refs/tags/$pkgver/$_archive.tar.gz")
sha256sums=('d28f878732f3abfb6ffe8490d6c9c9b80c4381a89b7e52a1ac802232c1e08ca5')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
