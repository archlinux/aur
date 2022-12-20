# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontdiffenator
pkgver=0.9.13
pkgrel=1
pkgdesc='Font regression tester for Google Fonts'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache)
_py_deps=(fonttools
          pillow
          cairo
          uharfbuzz
          freetype-py)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-setuptools)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('6735b98ec54dbc17974dc6fb92febbb3b0cc08174d0cc6cbad970a2925f282f9')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
