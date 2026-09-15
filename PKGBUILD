# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mumulhl <mumulhl@duck.com>

pkgname=python-giturlparse
_pyname=giturlparse
pkgver=0.15.0
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
sha256sums=('7d3a56fd457546e909e56449e62343ef31041ff1b2780c4b1bcda14d66be67a8')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
