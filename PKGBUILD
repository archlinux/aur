# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=trufont
pkgver=0.6.6
pkgrel=2
pkgdesc='A streamlined and hackable font editor'
arch=(any)
url='https://trufont.github.io'
license=(GPL3 LGPL3)
_pydeps=(appdirs
         booleanoperations
         brotli
         compreffor
         cu2qu
         defcon
         fonttools
         fs
         hsluv
         lxml
         pyclipper
         pyqt5
         pyqt5-sip
         pytz
         six
         ufo-extractor
         ufo2ft
         unicodedata2
         zopfli)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(git
             python-setuptools-scm
             python-wheel)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.zip")
sha256sums=('0264939bfeb8b9b505f8cdb653faa67332724fadfa46b2b0898fd3c78468cd82')

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
