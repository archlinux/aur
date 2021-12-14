# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=glyphconstruction
_project=GlyphConstruction
pkgname=python-$_pipname
pkgver=0.8.3
_sha=d7c7dd5ffe8a48d089c49206197a9091886fcb10
pkgrel=2
pkgdesc='a simple, powerful, human-readable language for describing how glyph shapes are built'
arch=(any)
url="https://github.com/typemytype/$_project"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
_archive="$_project-$_sha"
source=("$_archive.tar.gz::$url/archive/$_sha.tar.gz")
sha256sums=('f0f6c48329f21aea6802dcf4d8790d1ca208723ace6e8c115c538be2c5809de5')

prepare() {
	cd "$_archive"
	sed -i -e 's!lib/glyph!Lib/glyph!' setup.py
}

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
