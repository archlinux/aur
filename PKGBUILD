# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-isbnlib2
_pkg="${pkgname#python-}"
pkgver=3.11.3
pkgrel=1
pkgdesc='Extract, clean, transform, hyphenate and metadata for ISBNs'
arch=(any)
url="https://pypi.python.org/pypi/$_pipname"
license=(LGPL-3.0-only)
provides=("${pkgname%2}")
conflicts=("${pkgname%2}")
depends=(python)
makedepends=(python-{build,installer} python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/hans-fritz-pommes/${_pkg%2}/archive/v$pkgver/${_pkg%2}-$_pkgver.tar.gz")
sha256sums=('08a8761476e7165c2e9cf72c9a797fb993c6ec457dee37226d78521db54697cd')

build() {
	cd "${_pkg%2}-$pkgver"
	python -m build -wn
}

package() {
	cd "${_pkg%2}-$pkgver"
	python -m installer -d "$pkgdir" dist/*.whl
}
