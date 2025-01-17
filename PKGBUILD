# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ygt
pkgver=0.2.7
pkgrel=1
pkgdesc='A graphical hint editor for TrueType fonts'
arch=(any)
url="https://github.com/psb1558/$pkgname"
license=(Apache-2.0)
_pydeps=(defcon
         fonttools
         freetype-py
         fs # fonttools[ufo]
         numpy
         pyqt6
         pyyaml
         schema
         ufo2ft
         uharfbuzz
         xgridfit)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e2f813089c9380ce466f40816e6583dea2c5a0952ec600178f3d514cd193f258')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

