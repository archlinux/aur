# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyperglot
pkgver=0.8.2
pkgrel=1
pkgdesc='A database and tools for detecting language support in fonts'
arch=(any)
url="https://github.com/rosettatype/$pkgname"
license=(GPL-3.0-only)
_pydeps=(click
         colorlog
         fonttools
         unicodedata2
         yaml)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('0e41da89a3cd9edd0e88b6042a886dfba8ea9173ec0d67234c775e4eac774aca')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
