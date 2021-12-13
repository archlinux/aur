# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=dehinter
pkgver=4.0.0
pkgrel=2
pkgdesc='A tool for the removal of TrueType instruction sets (hints) in fonts'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=(MIT)
depends=(python
         python-fonttools)
makedepends=(python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c7fd270fdd6d1b67326c1af61a3497eb86974567aff7e96ebee836d81fa56769')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
