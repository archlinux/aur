# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hyperglot
pkgver=0.8.0
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
sha256sums=('0839e65ddd10b547e855d6a8a074d147238b0b10dfe25c57c4d6cbde3c540561')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
