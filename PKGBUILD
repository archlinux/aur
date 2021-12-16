# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>

pkgname=python-markdown2
pkgver=2.4.2
pkgrel=1
pkgdesc='A fast and complete implementation of Markdown in Python'
url="https://github.com/trentm/$pkgname"
license=(MIT)
arch=(any)
depends=(python)
makedepends=(python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tgz::$url/archive/${pkgver}.tar.gz")
sha256sums=('aa3c547ce0425c884046d22c63f5aed0e4196380cbe3483d8b0531c338f63dac')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
